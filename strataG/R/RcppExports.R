# This file was generated by Rcpp::compileAttributes
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

indGenotype <- function(nInd, numAlleles, locus) {
    .Call('strataG_indGenotype', PACKAGE = 'strataG', nInd, numAlleles, locus)
}

HoCalc <- function(nInd, loci, ploidy, strata, strataN) {
    .Call('strataG_HoCalc', PACKAGE = 'strataG', nInd, loci, ploidy, strata, strataN)
}

HsCalc <- function(alleleFreq, ploidy, strataN, harmN, Ho) {
    .Call('strataG_HsCalc', PACKAGE = 'strataG', alleleFreq, ploidy, strataN, harmN, Ho)
}

Hstats_C <- function(loci, strata, ploidy) {
    .Call('strataG_Hstats_C', PACKAGE = 'strataG', loci, strata, ploidy)
}

getMaxInt <- function(x) {
    .Call('strataG_getMaxInt', PACKAGE = 'strataG', x)
}

table2D <- function(x, y) {
    .Call('strataG_table2D', PACKAGE = 'strataG', x, y)
}

rowSumC <- function(x) {
    .Call('strataG_rowSumC', PACKAGE = 'strataG', x)
}

colSumC <- function(x) {
    .Call('strataG_colSumC', PACKAGE = 'strataG', x)
}

colMeanC <- function(x) {
    .Call('strataG_colMeanC', PACKAGE = 'strataG', x)
}

intOuterC <- function(x, y) {
    .Call('strataG_intOuterC', PACKAGE = 'strataG', x, y)
}

numOuterC <- function(x, y) {
    .Call('strataG_numOuterC', PACKAGE = 'strataG', x, y)
}

intVecToMat <- function(x, ncol) {
    .Call('strataG_intVecToMat', PACKAGE = 'strataG', x, ncol)
}

numVecToMat <- function(x, ncol) {
    .Call('strataG_numVecToMat', PACKAGE = 'strataG', x, ncol)
}

calcStrataN <- function(locus, strata) {
    .Call('strataG_calcStrataN', PACKAGE = 'strataG', locus, strata)
}

statChi2_C <- function(loci, strataMat, ploidy) {
    .Call('strataG_statChi2_C', PACKAGE = 'strataG', loci, strataMat, ploidy)
}

statFis_C <- function(loci, strataMat, ploidy) {
    .Call('strataG_statFis_C', PACKAGE = 'strataG', loci, strataMat, ploidy)
}

alleleFreqCalc <- function(locVec, strata, ploidy) {
    .Call('strataG_alleleFreqCalc', PACKAGE = 'strataG', locVec, strata, ploidy)
}

prHetCalc <- function(alleles, nvec, locusMat, strata, ploidy) {
    .Call('strataG_prHetCalc', PACKAGE = 'strataG', alleles, nvec, locusMat, strata, ploidy)
}

varCompCalc <- function(nvec, alleleFreq, prHet, r, nbar, rnbar, nc) {
    .Call('strataG_varCompCalc', PACKAGE = 'strataG', nvec, alleleFreq, prHet, r, nbar, rnbar, nc)
}

fstCalc <- function(loci, strata, ploidy) {
    .Call('strataG_fstCalc', PACKAGE = 'strataG', loci, strata, ploidy)
}

statFst_C <- function(loci, strataMat, ploidy) {
    .Call('strataG_statFst_C', PACKAGE = 'strataG', loci, strataMat, ploidy)
}

statFstPrime_C <- function(loci, strataMat, ploidy) {
    .Call('strataG_statFstPrime_C', PACKAGE = 'strataG', loci, strataMat, ploidy)
}

statGst_C <- function(loci, strataMat, ploidy) {
    .Call('strataG_statGst_C', PACKAGE = 'strataG', loci, strataMat, ploidy)
}

statGstPrime_C <- function(loci, strataMat, ploidy, primeType) {
    .Call('strataG_statGstPrime_C', PACKAGE = 'strataG', loci, strataMat, ploidy, primeType)
}

statGstDblPrime_C <- function(loci, strataMat, ploidy) {
    .Call('strataG_statGstDblPrime_C', PACKAGE = 'strataG', loci, strataMat, ploidy)
}

statJostD_C <- function(loci, strataMat, ploidy) {
    .Call('strataG_statJostD_C', PACKAGE = 'strataG', loci, strataMat, ploidy)
}

ssWPCalc <- function(strataFreq, strataHapFreq, hapDist) {
    .Call('strataG_ssWPCalc', PACKAGE = 'strataG', strataFreq, strataHapFreq, hapDist)
}

ssAPCalc <- function(strataFreq, strataHapFreq, hapDist) {
    .Call('strataG_ssAPCalc', PACKAGE = 'strataG', strataFreq, strataHapFreq, hapDist)
}

statPhist_C <- function(hapMat, strataMat, hapDist) {
    .Call('strataG_statPhist_C', PACKAGE = 'strataG', hapMat, strataMat, hapDist)
}

