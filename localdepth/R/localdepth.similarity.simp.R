#############################################################
#
#	localdepth.similarity.simp function
#	Author: Claudio Agostinelli and Mario Romanazzi
#	E-mail: claudio@unive.it
#	Date: April, 02, 2009
#	Version: 0.1-3
#
#	Copyright (C) 2009 Claudio Agostinelli and Mario Romanazzi
#
#############################################################

localdepth.similarity.simp <- function(x, y=NULL, tau, use=c('volume', 'diameter'), weight=NULL) {
  use <- match.arg(use)
  if (is.null(y))
    y <- x
  
  if (is.matrix(x) | is.data.frame(x)) {
    if (ncol(x)!=2) stop('x must have 2 columns')
    nx <- nrow(x)
    if (nx < 3) stop('x must have at least 3 rows')
    if (!(is.matrix(y) | is.data.frame(y))) stop('y must be a matrix or a data.frame')
    if (ncol(y)!=2) stop('y must have 2 columns')
    result <- localdepth2Dsimplicialsimilarity(x,y,tau,use,weight)
  } else if (is.vector(x)) {
    nx <- length(x)
    if (nx < 2) stop('x must have at least length 2')
    if (!is.vector(y)) stop('y must be a vector')
    result <- localdepth1Dsimplicialsimilarity(x,y,tau,use)
  } else {
      stop('Not implemented for dimension different of 1 or 2')
  }

  result$localdepth <- result$localdepth/result$num
  result$depth <- result$depth/result$num
  result$max.localdepth <- max(result$localdepth)
  result$max.depth <- max(result$depth)
  result$num <- c(result$num,   result$num)  
  result$call <- match.call()
  result$tau <- tau
  result$use <- use
  result$tol <- 0  
  result$x <- x
  result$y <- y
  result$type <- 'exact'
  result$nsamp <- 'all'
  result$method <- 'simplicial'  
  class(result) <- 'localdepth.similarity'
  return(result)
}

