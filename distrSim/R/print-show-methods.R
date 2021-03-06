setMethod("print", "Dataclass",
          function(x, ..., NOT.A.SIMULATION = TRUE){
            if(NOT.A.SIMULATION)
               {cat(gettextf("name of Dataclass: %s\n", name(x)))
                cat(gettextf("filename of Dataclass: %s\n", filename(x)))
               }
            cat(gettextf("number of runs: %d\n", runs(x)))
            cat(gettextf("dimension of the observations: %d\n", obsDim(x)))
            cat(gettextf("size of sample: %d\n", samplesize(x)))
            if(!isOldVersion(x))
                cat(gettextf("object was generated by version: %s\n",
                    getVersion(x)))
          })

setMethod("show", "Dataclass",
          function(object) print(object))


setMethod("print","Simulation",
          function(x,...){
            if(!is.null(filename(x)))
                cat(gettextf("filename of Simulation: %s\n",filename(x)))
            if(!is.null(seed)){
            cat(gettextf("Seed:  Kind: %s\n       Normal Kind: %s\n",
                seed(x)[[1]], seed(x)[[2]]))
            cat(gettextf("       first 6 numbers: % 011i\t% 011i\t% 011i\n", 
                   seed(x)[[3]][2], seed(x)[[3]][3], seed(x)[[3]][4]))
            cat(gettextf("                        % 011i\t% 011i\t% 011i\n", 
                   seed(x)[[3]][5], seed(x)[[3]][6], seed(x)[[3]][7]))}
            print(as(x,"Dataclass"), ..., NOT.A.SIMULATION = FALSE)
            cat(gettextf("Distribution:\n"))
            print(distribution(x))
          })

setMethod("show", "Simulation",
          function(object)print(object))


setMethod("print","Contsimulation",
          function(x,...){
            cat(gettextf("filename of Simulation: %s\n", filename(x)))
            if(!is.null(seed)){
            cat(gettextf("Seed:  Kind: %s\n       Normal Kind: %s\n",
                seed(x)[[1]], seed(x)[[2]]))
            cat(gettextf("       first 6 numbers: % 011i\t% 011i\t% 011i\n", 
                   seed(x)[[3]][2], seed(x)[[3]][3], seed(x)[[3]][4]))
            cat(gettextf("                        % 011i\t% 011i\t% 011i\n", 
                   seed(x)[[3]][5], seed(x)[[3]][6], seed(x)[[3]][7]))}
            print(as(x, "Dataclass"), ..., NOT.A.SIMULATION = FALSE)
            cat(gettextf("rate of contamination: %f\n",rate(x)))

            distr.id <-distribution.id(x)
            distr.c <- distribution.c(x)

            cat(gettextf("ideal distribution:\n"))
            print(distr.id)
            cat(gettextf("contaminating distribution:\n"))
            print(distr.c)
          })


setMethod("show", "Contsimulation",
          function(object)print(object))

setMethod("print", "SeqDataFrames",
          function(x, ..., short = FALSE){
            nruns <- runs(x)
            nobsDims <- obsDim(x)
            nobs <- samplesize(x)
            if(short) {
               nruns <- min(runs(x),getdistrSimOption("MaxNumberofPrintedRuns")) 
               nobsDims <- min(obsDim(x),getdistrSimOption("MaxNumberofPrintedObsDims")) 
               nobs <- lapply(x@data, function(y) min(nrow(y),getdistrSimOption("MaxNumberofPrintedObs")))
               }
            for(k in 1:nruns){
                cat(names(x)[k],":\n")
                print(x@data[[k]][1:nobs[k],1:nobsDims])}            
          })

setMethod("show", "SeqDataFrames",
          function(object) print(object))
