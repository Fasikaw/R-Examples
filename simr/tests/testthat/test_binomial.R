context("Binomial")

## Logical response

zbin <- with(simdata, z < 3)
glm_bin1 <- glm(zbin ~ x + g, family="binomial", data=simdata)
glmm_bin1 <- glmer(zbin ~ x + (1|g), family="binomial", data=simdata)

test_that("binomial with logical response works", {

  temp <- doTest(doFit(doSim(glm_bin1), glm_bin1))
  temp <- doTest(doFit(doSim(glmm_bin1), glmm_bin1))

})

## Cbind response

glm_bin2 <- glm(cbind(z, 10-z) ~ x + g, family="binomial", data=simdata)
glmm_bin2 <- glmer(cbind(z, 10-z) ~ x + (1|g), family="binomial", data=simdata)

test_that("binomial with cbind response works", {

  temp <- doTest(doFit(doSim(glm_bin2), glm_bin2))
  temp <- doTest(doFit(doSim(glmm_bin2), glmm_bin2))

})

## Mixing Poisson and binomial
