## ---- echo=FALSE---------------------------------------------------------
library(memuse)
matmemsize <- function(n) capture.output(memuse::mu(8*2*(n+1)*n))

## ------------------------------------------------------------------------
x <- matrix(0, 20, 5)
x[1, ] <- 1

## ------------------------------------------------------------------------
coop::sparsity(x)

## ------------------------------------------------------------------------
coop::sparsity(scale(x, T, F))

