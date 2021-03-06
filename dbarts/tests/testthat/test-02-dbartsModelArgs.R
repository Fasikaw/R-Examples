context("dbarts model arguments")

source(system.file("common", "friedmanData.R", package = "dbarts"))

test_that("non-prior, model arguments raise errors", {
  expect_error(dbarts(y ~ x, testData, verbose = NA))
  expect_error(dbarts(y ~ x, testData, verbose = "not-a-logical"))

  expect_error(dbarts(y ~ x, testData, n.samples = -1L))
  expect_error(dbarts(y ~ x, testData, n.samples = "not-an-integer"))

  expect_error(dbarts(y ~ x, testData, sigma = -1.0))
  expect_error(dbarts(y ~ x, testData, sigma = "not-an-integer"))
})

test_that("prior model arguments raise errors", {
  expect_error(dbarts(y ~ x, testData, tree.prior = normal))
  expect_error(dbarts(y ~ x, testData, tree.prior = cgm(0, 0)))
  expect_error(dbarts(y ~ x, testData, tree.prior = cgm(1, 0)))
  expect_error(dbarts(y ~ x, testData, tree.prior = cgm(1, 0, "extra")))
  expect_error(dbarts(y ~ x, testData, tree.prior = cgm(1, 1)))
  
  expect_error(dbarts(y ~ x, testData, node.prior = cgm))
  expect_error(dbarts(y ~ x, testData, node.prior = normal(0)))

  expect_error(dbarts(y ~ x, testData, resid.prior = binomial))
  expect_error(dbarts(y ~ x, testData, resid.prior = chisq(0, 0)))
  expect_error(dbarts(y ~ x, testData, resid.prior = chisq(1, 0)))
})

test_that("prior model arguments create valid objects", {
  expect_is(dbarts(y ~ x, testData, verbose = FALSE, n.samples = 500,
                   tree.prior = cgm(0.75, 0.5), node.prior = normal(3.5),
                   resid.prior = chisq(5, 0.9), sigma = 1.0), "dbartsSampler")
})
