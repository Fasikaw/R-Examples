.rdirichlet.MCMCpack <- function (n, alpha) 
{
    l <- length(alpha)
    x <- matrix(rgamma(l * n, alpha), ncol = l, byrow = TRUE)
    sm <- x %*% rep(1, l)
    return(x/as.vector(sm))
}

## code from MCMCpack