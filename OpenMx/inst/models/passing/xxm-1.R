# Bivariate random-intercepts model
# Originally from http://xxm.times.uh.edu/learn-xxm/xxm-tutorial/

library(OpenMx)

set.seed(1)
sData <- suppressWarnings(try(read.csv("models/passing/data/brim.student.csv"), silent=TRUE))
if (is(sData, "try-error")) sData <- read.csv("data/brim.student.csv")

sData$teacher <- as.integer(sData$teacher)

tMod <- mxModel("teacher", type="RAM",
                latentVars = c("eta1", "eta2"),
                mxData(type="raw", observed=data.frame(teacher=unique(sData$teacher)),
                       primaryKey = "teacher"),
                mxPath(c("eta1", "eta2"), connect = "unique.pairs", arrows=2,
                       labels=paste0("psi", 1:3), values=c(.11,0,.12)))

sMod <- mxModel("student", type="RAM", tMod,
                manifestVars = c("y1", "y2"),
                mxData(type="raw", observed=sData, sort=FALSE),
                mxPath("one", paste0("y",1:2), values=rnorm(2)),
                mxPath(c("y1", "y2"), connect = "unique.pairs", arrows=2,
                       labels=paste0("theta", 1:3), values=c(1.1,0,1.2)),
                mxPath(paste0("teacher.eta", 1:2), paste0("y",1:2),
                       free=FALSE, values=.98, joinKey = "teacher"))

#sMod$expectation$verbose <- 2L

if (0) {
	# Does multigroup work without rampart? Why not? TODO
	#sMod$expectation$.rampart <- 0L
	#sMod$expectation$.forceSingleGroup <- TRUE
	dist <- mxRun(mxModel(sMod,
			      mxComputeSequence(list(
				  mxComputeOnce('expectation', 'distribution', 'flat'),
				  mxComputeReportExpectation()))))

	#str(dist$expectation$output)
	#str(dist$expectation$debug)
	eo = dist$expectation$output
	ed = dist$expectation$debug
	names(ed$detail)

	ed$layout[1:40,]
	#print(ed$detail$g01$aIndex[1:10])
#	ed$detail$g01$covariance[1:10,1:10]
	print(round(ed$detail$g01$mean[1:20], 2))
#	round(ed$detail$g01$dataVec[1:20], 2)

#	print(ed$detail$g02$aIndex[1:10])
#	ed$detail$g02$covariance[1:10,1:10]
	#round(ed$detail$g02$mean[1:20],2)
#	round(ed$detail$g02$dataVec[1:10], 2)
	stop("here")

	dist$expectation$output$covariance[1:10,1:10]
	dist$expectation$output$covariance[120:130,120:130]
	eigen(dist$expectation$output$covariance)$val

	round(dist$expectation$debug$A[1:20,1:20], 2)
	dist$expectation$debug$S[1:10,1:10]
}

sMod <- mxRun(sMod)

omxCheckCloseEnough(sMod$output$fit, 445.4331, .01)
omxCheckCloseEnough(sMod$expectation$debug$numGroups, 2)
omxCheckCloseEnough(sMod$expectation$debug$rampartUsage, 50)
