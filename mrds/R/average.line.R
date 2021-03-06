#' Average detection function line for plotting
#'
#' For models with covariates the detection probability for each observation
#' can vary. This function computes an average value for a set of distances to
#' plot an average line to graphically represent the fitted model in plots that
#' compare histograms and the scatter of individual estimated detection
#' probabilities. Averages are calculated over the observed covariate
#' combinations.
#'
#' @param finebr set of fine breaks in distance over which detection function
#'   values are averaged and plotted
#' @param obs value of observer for averaging (1-2 individual observers; 3
#'   duplicates; 4 pooled observation team)
#' @param model ddf model object
#' @return list with 2 elements
#'   \tabular{ll}{\code{xgrid} \tab vector of gridded distance values\cr
#'   \code{values} \tab vector of average detection function values at
#'        the \code{xgrid} values\cr}
#' @note Internal function called from plot functions for ddf objects
#' @author Jeff Laake
#' @keywords utility
average.line <- function(finebr,obs,model){

  xgrid <- NULL
  linevalues <- NULL

  # Depending on the type of model, setup data to be used for prediction
  # selecting the specified observer and only those detected (detected=1).
  if(model$method=="io"){
    newdat <- model$mr$mr$data
  }else{
    if(model$method=="trial" | model$method=="trial.fi"){
      newdat <- process.data(model$data,model$meta.data)$xmat
      newdat <- newdat[newdat$observer==obs & newdat$detected==1,]
    }else{
      if(model$method=="rem.fi"){
        newdat <- model$data
      }else{
        newdat <- model$mr$data
      }
    }
  }
  newdat$offsetvalue <- rep(0,dim(newdat)[1])

  #  Also, depending on the type of model, get det fct predicted values
  #  Note g0 = p(0) and prob.det are integrated values (mu) (in ADS ch 6)
  if(model$method=="io" | model$method=="trial"| model$method=="rem"){
    prob.det <- predict(model)$fitted
    newdat$distance <- 0
    ddfobj <- model$ds$ds$aux$ddfobj

    # find apex for gamma model
    if(ddfobj$type=="gamma"){
      if(model$method=="io"){
        newdat$distance <- rep(apex.gamma(ddfobj),2)
      }else{
        newdat$distance <- as.vector(apex.gamma(ddfobj))
      }
    }

    # g0 is p^c(0,z) in equation (6.28), ADS
    if(model$method=="trial"){
      g0 <- predict(model$mr$mr,newdat,type="response")
    }else{
      g0 <- predict(model$mr,newdat,integrate=FALSE)$fitted
    }
  }else{
    prob.det <- predict(model,newdat,integrate=TRUE)$fitted
    newdat$distance <- 0
    g0 <- predict(model,newdat,integrate=FALSE)$fitted
  }


  # For each element in the finebr grid, compute a value for x and the
  # appropriate p(x) averaged over all the covariate values
  for (i in 1:(length(finebr)-1)){
    # Compute x as the midpoint of the breaks and
    #  store as distance in dataframe
    x <- (finebr[i]+finebr[i+1])/2
    xgrid <- c(xgrid,x)
    newdat$distance <- rep(x,dim(newdat)[1])

    # Based on model compute p(x) from conditional detection function
    if(model$method!="io" & model$method!="rem"){
      cond.det <- predict(model,newdata=newdat,integrate=FALSE)
    }else{
      cond.det <- predict(model$mr,newdata=newdat,integrate=FALSE)
    }

    if(model$method=="io" | model$method=="io.fi"|
       model$method=="rem" | model$method=="rem.fi"){
      p1 <- cond.det$p1
      p2 <- cond.det$p2
    }else{
      p1 <- cond.det$fitted
    }

    # If this is a point independence model (io, trial, rem) compute the
    # delta(x) values; otherwise set to 1
    par <- model$ds$par

    # See ADS p. 130-140 for details
    if(model$method=="io" | model$method=="trial" | model$method=="rem"){
      detfct.pooled.values <- detfct(newdat$distance[newdat$observer==1],
                                     ddfobj,width=model$meta.data$width-
                                                  model$meta.data$left)
      # substitute (6.28) into (6.27), ADS ch 6
      # this is actually: deltax <- (detfct.pooled.values*g0)/cond.det$fitted
      # so 1/delta(x)
      deltax <- detfct.pooled.values/(cond.det$fitted/g0)
    }else{
      detfct.pooled.values <- cond.det$fitted/g0
      deltax <- rep(1,length(detfct.pooled.values))
    }

    # Depending on observer compute average values for all observed
    # covariate values at specified distance (x)
    if(obs==1){
      linevalues <- c(linevalues,sum(p1*deltax/prob.det)/sum(1/prob.det))
    }else if(obs==2){
      linevalues <- c(linevalues,sum(p2*deltax/prob.det)/sum(1/prob.det))
    }else if(obs==3){
      linevalues <- c(linevalues,
                      sum(g0*detfct.pooled.values/prob.det)/sum(1/prob.det))
      # no idea why we are dividing by g0 above, only to multiply here...
    }else{
      linevalues <- c(linevalues,sum(p1*p2*deltax/prob.det)/sum(1/prob.det))
    }
  }

  return(list(xgrid=xgrid,values=linevalues))
}
