"fun.mApply" <-
function(X, INDEX, FUN = NULL, ..., simplify = TRUE)
{
## Matrix tapply
## X: matrix with n rows; INDEX: vector or list of vectors of length n
## FUN: function to operate on submatrices of x by INDEX
## ...: arguments to FUN; simplify: see sapply
## Modification of code by Tony Plate <tplate@blackmesacapital.com> 10Oct02
## If FUN returns more than one number, mApply returns a matrix with
## rows corresponding to unique values of INDEX
nr <- nrow(X)
if(!length(nr)) {
## X not a matrix
r <- tapply(X, INDEX, FUN, ..., simplify = simplify)
if(is.matrix(r))
r <- drop(t(r))
else if(simplify && is.list(r))
r <- drop(matrix(unlist(r), nrow = length(r), dimnames = list(names(r), names(r[[1]])), byrow = TRUE))
}
else {
idx.list <- tapply(1:nr, INDEX, c)
r <- sapply(idx.list, function(idx, x, fun, ...)
fun(x[idx,  , drop = FALSE], ...), x = X, fun = FUN, ..., simplify = simplify)
if(simplify)
r <- drop(t(r))
}
if(simplify && is.list(r) && is.array(r)) {
ll <- sapply(r, length)
maxl <- max(ll)
empty <- (1:length(ll))[ll == 0]
for(i in empty)
r[[i]] <- rep(NA, maxl)
## unlist not keep place for NULL entries for nonexistent categories
first.not.empty <- ((1:length(ll))[ll > 0])[1]
nam <- names(r[[first.not.empty]])
dr <- dim(r)
r <- aperm(array(unlist(r), dim = c(maxl, dr), dimnames = c(list(nam), dimnames(r))), c(1 + seq(length(dr)), 1))
}
r
}

