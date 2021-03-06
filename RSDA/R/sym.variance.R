sym.variance <-
function(sym.var,method=c('centers','interval','billard','histogram'),na.rm=FALSE, ...) {
  method<-match.arg(method)
  if(method=='centers') {
    if(sym.var$var.type=='$C')
      return(var(sym.var$var.data.vector))  
    if(sym.var$var.type=='$I') 
      return(var(sym.var$var.data.vector[,1]+sym.var$var.data.vector[,2])/2)
    else 
      stop("Impossible to compute the variance for this type of variable with this method")    
  }
  if(method=='interval') {
    if(sym.var$var.type=='$I') 
      return(sapply(sym.var$var.data.vector,var))
    else 
      stop("Impossible to compute the variance for this type of variable with this method")    
  }  
  if(method=='billard') {
    if(sym.var$var.type=='$I') 
      return((1/(3*sym.var$N))*sum(sym.var$var.data.vector[,1]^2+
             (sym.var$var.data.vector[,1]*sym.var$var.data.vector[,2])+
         sym.var$var.data.vector[,2]^2)-
        (1/(4*(sym.var$N)^2))*sum(sym.var$var.data.vector[,1]+
        sym.var$var.data.vector[,2])^2)
    else 
      stop("Impossible to compute the variance for this type of variable with this method")    
  }  
  if(method=='histogram') {
    if(sym.var$var.type=='$H')
      return(sapply(sym.var$var.data.vector,var))
    else 
      stop("Impossible to compute the variance for this type of variable with this method")    
  }
}
