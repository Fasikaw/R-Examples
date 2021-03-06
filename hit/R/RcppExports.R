# This file was generated by Rcpp::compileAttributes
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' @title Create a hierarchy from a dendrogram
#' 
#' @description A function which can be called from R. It is creating a 
#' hierarchy from a dendrogram.
#' 
#' @param x A dendrogram S3 R object.
#' @param height A vector of heights at which nodes are grouped.
#' @param newNames Names of the variabels which should be part of the 
#' hierarchy.
#'
#' @keywords internal
dend2hier <- function(x, height, newNames) {
    .Call('hit_dend2hier', PACKAGE = 'hit', x, height, newNames)
}

