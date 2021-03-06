qsum <- function(x) {

    if (! (is.numeric(x) || is.character(x)))
        stop("'x' not numeric or character")

    if (is.numeric(x))
        x <- d2q(x)

    if (! (is.character(x))) {
        stop("Cannot happen!")
    }

    .Call("qsump", x, as.integer(1), PACKAGE = "rcdd")
}
