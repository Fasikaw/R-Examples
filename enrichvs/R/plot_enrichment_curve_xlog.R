# Plot a enrichment curve with a logarithmic scale on the x axis
# x: a vector for scores
# y: a vector for labels
#
# e.g.)
# > x <- rnorm(100001) - 1:100001 * 0.00005
# > y <- c(rep(1,501), rep(0,length(x)-501))
# > plot_enrichment_curve_xlog(x, y)
# plot_enrichment_curve_xlog(dud_egfr$energy, dud_egfr$label)

plot_enrichment_curve_xlog <- function(x, y, decreasing=TRUE, npoint=100, 
      colbarwidth=1, colorize=FALSE, add=FALSE, col="black", lwd=2) {
  if ( length(x) != length(y) ){
    stop(paste("The number of scores must be equal to the number of labels."))
  }
  xmin <- 100 / length(x)

  ord <- order(x, decreasing=decreasing)
  at <- round(10^( log10( length(y) ) / npoint * 1:npoint ), 0)
  cutoffs <- x[ord][at]

  lig_sampled <- ( cumsum(y[ord]) / sum(y) )[at]
  lig_ideal <- ( cumsum( sort(y, decreasing=TRUE) ) / sum(y) )[at]
  n_sampled <- (1:length(y) / length(y) )[at]
  
  if( colorize == FALSE ){
    if( add == FALSE ){
      ### ideal & random ###
      plot( 1:100, 1:100, xlim=c(xmin, 100), ylim=c(0,100), type="n", las=1, log="x", 
        xlab="top % of ranked database", ylab="% found Activities (yield)"
      )
      ### ideal & random ###
      lines( 100 * n_sampled, 100 * lig_ideal, lwd=lwd, lty=2)
      lines( 1:100, 1:100, lwd=lwd, lty=3, col="grey")
    }
    plot.xy( xy.coords(100 * n_sampled, 100 * lig_sampled, log="x"), col=col, type="l", lwd=lwd)
  } else {

    col=rev( rainbow(npoint,start=0, end=2/3) )
    if( add == FALSE ){
      plot( y, y, xlim=c(xmin, 100), ylim=c(0,100), type="n", las=1,  log="x", 
        xlab="top % of ranked database", ylab="% found Activities (yield)"
      )
      max.y <- max(axTicks(4))
      min.y <- min(axTicks(4))
  
      colbar.left <- rep(160-colbarwidth*10, npoint)
      colbar.right <- rep(160, npoint)
      colbar.upper <- seq(to=100,by=100/npoint, length=npoint)
      colbar.lower <- seq(to=100,by=100/npoint, length=npoint) - 100/npoint
      rect(colbar.left, colbar.lower, colbar.right, colbar.upper, 
        col=rainbow(npoint,start=0, end=2/3), border=rainbow(npoint,start=0, end=2/3))
      axis.at <- round(0:5 * npoint/5, 0)
      axis(side=4, at=(0:5)*20, labels=round(cutoffs[(0:5)*20+1], 1) )  # , las=1)

      ### ideal & random ###
      lines( 100 * n_sampled, 100 * lig_ideal, lwd=lwd, lty=2, log="x")
      lines(1:100, 1:100, lwd=lwd, lty=3, col="grey", log="x")
    }
    ### scores ###
    for( n in 1:(npoint-1) ){
      color.n <- col[ round( npoint * (x[ord][at][n] - min(x)) / ( max(x) - min(x) ), 0) ]
      plot.xy( xy.coords(100 * n_sampled[c(n, n+1)], 100 * lig_sampled[c(n, n+1)], log="x"), type="l", lwd=lwd, col=color.n, log="x")
    }
  }
}
