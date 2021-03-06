##########################################################
####### el.test(), from Owen, Modified by Mai Zhou #######
##########################################################

el.test <- function( x, mu, lam, maxit=25, gradtol=1e-7, 
                        svdtol = 1e-9, itertrace=FALSE ){
x <- as.matrix(x)
n <- nrow(x)
p <- ncol(x)
mu <- as.vector(mu)
if( length(mu) !=p )
  stop("mu must have same dimension as observation vectors.")
if( n <= p )
  stop("Need more observations than length(mu) in el.test().")

z <- t( t(x) -mu )

#
#    Scale the problem, by a measure of the size of a 
# typical observation.  Add a tiny quantity to protect
# against dividing by zero in scaling.  Since z*lam is
# dimensionless, lam must be scaled inversely to z.
#
TINY <- sqrt( .Machine$double.xmin )
scale <- mean( abs(z) ) + TINY
z <- z/scale
if( !missing(lam) ){
  lam <- as.vector(lam)
  lam <- lam*scale
  if( logelr(z,rep(0,p),lam)>0 )lam <- rep(0,p)
}
if(  missing(lam)  )
  lam <- rep(0,p)
#
#     Take some precaution against users specifying
# tolerances too small.
#

if( svdtol < TINY )svdtol <- TINY
if( gradtol < TINY)gradtol <- TINY

#
#    Preset the weights for combining Newton and gradient
# steps at each of 16 inner iterations, starting with
# the Newton step and progressing towards shorter vectors
# in the gradient direction.  Most commonly only the Newton
# step is actually taken, though occasional step reductions
# do occur.
#

nwts <- c( 3^-c(0:3), rep(0,12) )
gwts <- 2^( -c(0:(length(nwts)-1)))
gwts <- (gwts^2 - nwts^2)^.5
gwts[12:16] <- gwts[12:16] * 10^-c(1:5)

#
#    Iterate, finding the Newton and gradient steps, and
# choosing a step that reduces the objective if possible.
#

nits <- 0
gsize <- gradtol + 1
while(  nits<maxit && gsize > gradtol  ){
  arg  <- 1 + z %*% lam
  wts1 <- as.vector( llogp(arg, 1/n) )
  wts2 <- as.vector( -llogpp(arg, 1/n) )^.5
  grad <- as.matrix( -z*wts1 )
  #############grad <- as.vector( apply( grad, 2, sum ) )
  grad <- as.vector(rowsum(grad, rep(1, nrow(grad)) ) )
  gsize <- mean( abs(grad) )
  hess <- z*wts2
#                                   -1
#    The Newton step is -(hess'hess)    grad,
#  where the matrix hess is a sqrt of the Hessian.
#  Use svd on hess to get a stable solution.
#

## may try La.svd() in R (v. > 1.0) for better LAPACK.
## or use QR decomposition on hess to solve it.

  svdh <- svd( hess )
##  svdh <- La.svd( hess )
  if( min(svdh$d) < max(svdh$d)*svdtol )
    svdh$d <- svdh$d + max(svdh$d)*svdtol
  nstep <- svdh$v %*% (t(svdh$u)/svdh$d)
## nstep <- t(svdh$vt) %*% (t(svdh$u)/svdh$d)
  nstep <- as.vector( nstep %*% matrix(wts1/wts2,n,1) )

  gstep <- -grad
  if(  sum(nstep^2) < sum(gstep^2) )
    gstep <- gstep*(sum(nstep^2)^.5/sum(gstep^2)^.5)
  ologelr <- -sum( llog(arg,1/n) )
  ninner <- 0
  for(  i in 1:length(nwts) ){
    nlogelr <- logelr( z,rep(0,p),lam+nwts[i]*nstep+gwts[i]*gstep )
    if( nlogelr < ologelr ){
      lam <- lam+nwts[i]*nstep+gwts[i]*gstep
      ninner <- i
      break
    }
  }
  nits <- nits+1
  if(  ninner==0  )nits <- maxit
  if( itertrace )
    print( c(lam, nlogelr, gsize, ninner) )
}

list( "-2LLR" = -2*nlogelr, Pval = 1-pchisq(-2*nlogelr, df=p),
     lambda = lam/scale, grad=grad*scale,
 hess=t(hess)%*%hess*scale^2, wts=wts1, nits=nits )
}

logelr <- function( x, mu, lam ){ 
x <- as.matrix(x)
n <- nrow(x)
p <- ncol(x)
if(  n <= p  )
  stop("Need more observations than variables in logelr.")
mu <- as.vector(mu)
if(  length(mu) != p  )
  stop("Length of mean doesn't match number of variables in logelr.")

z <- t( t(x) -mu )
arg <- 1 + z %*% lam
return( - sum( llog(arg,1/n) ) ) 
}

#
#    The function llog() is equal to the natural
#  logarithm on the interval from eps >0 to infinity.
#  Between -infinity and eps, llog() is a quadratic.
#  llogp() and llogpp() are the first two derivatives
#  of llog().  All three functions are continuous
#  across the "knot" at eps.
#
#    A variation with a second knot at a large value
#  M did not appear to work as well.
#
#    The cutoff point, eps, is usually 1/n, where n
#  is the number of observations.  Unless n is extraordinarily
#  large, dividing by eps is not expected to cause numerical
#  difficulty.
#

llog <- function( z, eps ){
ans <- z
avoidNA <- !is.na(z)
lo <- (z<eps) & avoidNA  ### added 3/2012
ans[ lo  ] <- log(eps) - 1.5 + 2*z[lo]/eps - 0.5*(z[lo]/eps)^2
ans[ !lo ] <- log( z[!lo] )
ans
}

llogp <- function( z, eps ){
ans <- z
avoidNA <- !is.na(z)    ###added 3/2012
lo <- (z<eps) & avoidNA
ans[ lo  ] <- 2.0/eps - z[lo]/eps^2
ans[ !lo ] <- 1/z[!lo]
ans
}

llogpp <- function( z, eps ){
ans <- z
avoidNA <- !is.na(z) 
lo <- (z<eps) & avoidNA    ### added same avoidNA as above
ans[ lo  ] <- -1.0/eps^2
ans[ !lo ] <- -1.0/z[!lo]^2
ans
}

