process_tm <- function(x, asp_ratio, shp_info, interactive) {
	fill <- NULL; xfill <- NULL; xraster <- NULL; text <- NULL
	## fill meta info
	
	gt <- preprocess_gt(x, interactive=interactive)
	
	## get grid element
	gridid <- which(names(x)=="tm_grid")[1]
	if (length(gridid)>1) gridid <- gridid[length(gridid)]
	gg <- x[[gridid]]
	
	## get credits, scale_bar and compass element
	sc_compIDs <- match(c("tm_scale_bar", "tm_compass"), names(x))
	gsb <- x[[sc_compIDs[1]]]
	gcomp <- x[[sc_compIDs[2]]]
	if (!is.null(gsb)) gsb$scale.id <- sc_compIDs[1]
	if (!is.null(gcomp)) gcomp$compass.id <- sc_compIDs[2]
	gcIDs <- which(names(x)=="tm_credits")
	if (is.na(gcIDs[1])) {
		gc <- NULL
	} else {
		gc <- do.call("mapply", c(x[gcIDs], list(nm=names(x[gcIDs][[1]]), FUN=function(..., nm) {
			if (nm %in% c("credits.text", "credits.position")) {
				unname(list(...))
			} else unname(c(...))
		}, SIMPLIFY=FALSE)))  
		#gc$credits.position <- unname(lapply(x[gcIDs], "[[", "credits.position"))
		gc$credits.id <- gcIDs
	}
	
	# get xlab and ylab element
	gxlabid <- which(names(x)=="tm_xlab")[1]
	if (length(gxlabid)>1) gxlabid <- gxlabid[length(gxlabid)]
	gylabid <- which(names(x)=="tm_ylab")[1]
	if (length(gylabid)>1) gylabid <- gylabid[length(gylabid)]
	glab <- c(if(is.na(gxlabid)) NULL else x[[gxlabid]],
			  if(is.na(gylabid)) NULL else x[[gylabid]])
			  
	## get facets element
	shape.id.orig <- which(names(x)=="tm_shape")
	facet.id.orig <- which(names(x)=="tm_facets")
	nshps <- length(shape.id.orig)
	facet.shp.id <- sapply(facet.id.orig, function(i){tail(which(shape.id.orig<i), 1)})
	facet.ids <- rep(0, nshps)
	if (length(facet.shp.id)) facet.ids[facet.shp.id] <- facet.id.orig
	# create gf for each shape
	gfs <- lapply(1:nshps, function(i){
		gf <- if (facet.ids[i]==0) tm_facets()$tm_facets else x[[facet.ids[i]]]
		gf$shp_name <- x[[shape.id.orig[i]]]$shp_name
		gf$shp_nr <- ifelse(!is.null(gf$by), i, 0)
		gf$by <- if (is.null(gf$by)) "" else gf$by
		gf
	})
	
	# get first specified gf
	startID <- which(vapply(gfs, FUN = function(x)!is.null(x$call), FUN.VALUE = 1)==1)[1]
	if (is.na(startID)) startID <- 1
	gf <- gfs[[startID]]
	if (startID>1) {
		gf$shp_name <- vapply(1:startID, FUN = function(x) gfs[[x]]$shp_name, FUN.VALUE = character(1))
		gf$shp_nr <- vapply(1:startID, FUN = function(x) gfs[[x]]$shp_nr, FUN.VALUE = numeric(1))
	}
	for (i in 1:startID) {
		x[[shape.id.orig[i]]]$by <- gfs[[i]]$by
	}
	
	# update with remaining gf's
	if (nshps>startID) {
		for (i in (startID+1):nshps) {
			gf$shp_name <- c(gf$shp_name, gfs[[i]]$shp_name)
			gf$shp_nr <- c(gf$shp_nr, gfs[[i]]$shp_nr)
			gf_args <- setdiff(gfs[[i]]$call, "by")
			gf[gf_args] <- gfs[[i]][gf_args]
			x[[shape.id.orig[i]]]$by <- gfs[[i]]$by
		}
	}
	xnames <- names(x)

	## find tm_grid position
	if ("tm_grid" %in% xnames) {
		gridID <- which(xnames=="tm_grid")
		shapeID <- which(xnames=="tm_shape")
		gridGrp <- tail(which(shapeID<gridID), 1)
		gridShpPos <- shapeID[gridGrp]
		
		gridPos <- if (gridID == gridShpPos+1) 1 else {
			belowGridLayers <- xnames[(gridShpPos+1):(gridID-1)]
			fillBorderID <- which(belowGridLayers %in% c("tm_fill", "tm_borders"))
			if (length(fillBorderID) >= 2) {
				belowGridLayers <- belowGridLayers[-fillBorderID[-1]]
			}
			sum(!(belowGridLayers %in% c("tm_layout", "tm_view", "tm_style", "tm_facets", "tm_credits", "tm_compass", "tm_scale_bar", "tm_xlab", "tm_ylab"))) + 1
		}
	} else {
		gridGrp <- 0
	}
	

	## split x into gmeta and gbody
	x <- x[!(xnames %in% c("tm_layout", "tm_view", "tm_style", "tm_grid", "tm_facets", "tm_credits", "tm_compass", "tm_scale_bar", "tm_xlab", "tm_ylab"))]

	n <- length(x)
	
	## split x into clusters
	shape.id <- which(names(x)=="tm_shape")
	if (shape.id[1] != 1) stop("First element should be a tm_shape element.", call. = FALSE)
	y <- rep(0, n); y[shape.id] <- 1
	cluster.id <- cumsum(y)
	gs <- split(x, cluster.id)
	
	nlx <- sapply(gs, length)
	if (any(nlx==1)) stop("Specify at least one layer after each tm_shape", call. = FALSE)
	
	## convert clusters to layers
	cnlx <- if (nshps==1) 0 else c(0, cumsum(nlx[1:(nshps-1)]-1))
	gp <- mapply(FUN=process_layers, gs, cnlx, MoreArgs = list(gt=gt, gf=gf, allow.small.mult=!interactive), SIMPLIFY = FALSE)
	names(gp) <- paste0("tmLayer", 1:length(gp))
	
	
	## add tm_grid to plot order
	if (gridGrp!=0) {
		plot.order <- gp[[gridGrp]]$plot.order
		if (gridPos==1) {
			plot.order <- c("tm_grid", plot.order)
		} else if (gridPos==length(plot.order)+1) {
			plot.order <- c(plot.order, "tm_grid")
		} else {
			plot.order <- c(plot.order[1:(gridPos-1)], "tm_grid", plot.order[gridPos:length(plot.order)])
		}
		gp[[gridGrp]]$plot.order <- plot.order
	}
	
	## get by vector
	data_by <- lapply(gp, function(i)i$data_by)
	
	## for raster: ignore drop.units
	is_raster <- lapply(gp, function(i)!is.null(i$raster))
	
	## for each 'grouped by' shape, where drop.units=TRUE, get order ids (used by split_tm) 
	order_by <- mapply(function(d, isr) {
		if (levels(d)[1]=="_NA_" || !gf$drop.units || isr) {
			NULL
		} else {
			lapply(1:nlevels(d), function(i)which(as.numeric(d)==i))
		}
	}, data_by, is_raster, SIMPLIFY=FALSE)
	
	## check if by is consistent among groups
	by_counts <- sapply(data_by, nlevels)
	if (sum(by_counts>1)>1) {
		by_counts_pos <- by_counts[by_counts>1]
		if (any(by_counts_pos[-1]!=by_counts_pos[1])) stop("Number of facets defined by the 'by' argument of tm_facets are different for the groups.", call. = FALSE)
		
	}
	
	if (any(by_counts>1)) {
		# get panel names
		panel.names <- gp[[which(by_counts>1)[1]]]$panel.names
	} else {
		panel.names <- NA
	}

	## check number of levels for two variables and override gf
	ncols <- sapply(gp, function(i)i$ncol)
	nrows <- sapply(gp, function(i)i$nrow)
	if (any(!is.na(ncols))) {
		if (!all(na.omit(ncols)==na.omit(ncols)[[1]]) | !all(na.omit(nrows)==na.omit(nrows)[[1]])) stop("Inconsistent levels of the 'by' argument of tm_facets.", call.=FALSE)
		gf$ncol <- na.omit(ncols)[1]
		gf$nrow <- na.omit(nrows)[1]
	}
	
	
	## determine number of small multiples
	nx <- max(sapply(gp, function(x){
		max(sapply(x$varnames, length))
	}))

	any.legend <- any(vapply(gp, function(x)x$any.legend, logical(1)))

	## process meta
	gmeta <- process_meta(gt, gf, gg, gc, gsb, gcomp, glab, nx, panel.names, asp_ratio, shp_info, any.legend, interactive)
	panel.mode <- if (!gmeta$panel.show) {
		"none"
	} else if (is.list(panel.names)) {
		"both"
	} else "one"
	
	#if (panel.mode!="none") gmeta$title <- rep("", nx)
	
	## split into small multiples
	gps <- split_tm(gp, nx, order_by)
	scale <- gmeta$scale
	
	gps <- mapply(function(x, i){
		x <- lapply(x, function(xx) {
			within(xx, {
				lwd <- lwd * scale
				
				if (!is.null(fill)) {
					if (!is.na(xfill[1])) fill.legend.misc$lwd <- fill.legend.misc$lwd * scale
				}

				if (!is.null(bubble.size)) {
					
					bubble.size <- bubble.size * scale
					bubble.border.lwd <- bubble.border.lwd * scale
					bubble.col.legend.misc$bubble.max.size <- bubble.col.legend.misc$bubble.max.size * scale
					bubble.col.legend.misc$bubble.border.lwd <- bubble.col.legend.misc$bubble.border.lwd * scale
					
					bubble.size.legend.misc$legend.sizes <- bubble.size.legend.misc$legend.sizes * scale
					bubble.size.legend.misc$bubble.border.lwd <- bubble.size.legend.misc$bubble.border.lwd * scale
				}
				
				if (!is.null(line.lwd)) {
					
					line.lwd <- line.lwd * scale
					line.col.legend.misc$line.legend.lwd <- line.col.legend.misc$line.legend.lwd * scale
					line.lwd.legend.misc$legend.lwds <- line.lwd.legend.misc$legend.lwds * scale
				}
				
				if (!is.null(text)) {
					text.size <- text.size * scale
					text.col.legend.misc$text.max.size <- text.col.legend.misc$text.max.size * scale
					text.size.legend.misc$legend.sizes <- text.size.legend.misc$legend.sizes * scale
					
				}


				if (!is.null(raster)) {
					if (!is.na(xraster[1])) raster.legend.misc$lwd <- raster.legend.misc$lwd * scale
				}

			})
		})

		# process credits text per facet
		gmeta$credits.show <- sapply(gmeta$credits.show, "[[", i)
		if (!is.null(gmeta$credits.text)) gmeta$credits.text <- get_text_i(gmeta$credits.text, i)
		#if (!is.null(gmeta$credits.text)) gmeta$credits.text <- sapply(gmeta$credits.text, "[[", i)
		gmeta[c("credits.text", "credits.size", "credits.col", "credits.alpha", "credits.align",
				"credits.bg.color", "credits.bg.alpha", "credits.fontface", "credits.fontfamily",
				"credits.position", "credits.id")] <- lapply(
					gmeta[c("credits.text", "credits.size", "credits.col", "credits.alpha", "credits.align",
							"credits.bg.color", "credits.bg.alpha", "credits.fontface", "credits.fontfamily",
							"credits.position", "credits.id")],
					function(gm) {
						gm[gmeta$credits.show]	
					})
		gmeta$credits.show <- any(gmeta$credits.show)
		x$tm_layout <- gmeta
		x$tm_layout$title <- x$tm_layout$title[i]
		x
	}, gps, 1:nx, SIMPLIFY=FALSE)

	#gmeta$panel.names <- panel.names
	gmeta$panel.mode <- panel.mode

	list(gmeta=gmeta, gps=gps, nx=nx, data_by=data_by)
}
