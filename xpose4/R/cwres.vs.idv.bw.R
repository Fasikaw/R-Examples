# Xpose 4
# An R-based population pharmacokinetic/
# pharmacodynamic model building aid for NONMEM.
# Copyright (C) 1998-2004 E. Niclas Jonsson and Mats Karlsson.
# Copyright (C) 2005-2008 Andrew C. Hooker, Justin J. Wilkins, 
# Mats O. Karlsson and E. Niclas Jonsson.
# Copyright (C) 2009-2010 Andrew C. Hooker, Mats O. Karlsson and 
# E. Niclas Jonsson.

# This file is a part of Xpose 4.
# Xpose 4 is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public License
# as published by the Free Software Foundation, either version 3
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public License
# along with this program.  A copy can be cound in the R installation
# directory under \share\licenses. If not, see http://www.gnu.org/licenses/.

## Added by Justin Wilkins
## 20/10/2005

"cwres.vs.idv.bw" <-
  function(object,
           #main = NULL,
           #xlb  = NULL,
           #ylb  = NULL,
           #onlyfirst=FALSE,
           #inclZeroWRES=FALSE,
           #subset=xsubset(object),
           #mirror=FALSE,
           #seed  = NULL,
           #bins  = 10,
           #samp  = NULL,
           ...) {

    ## check for arguments in function
    if(is.null(check.vars(c("cwres","idv"),
                          object,silent=FALSE))) {      
      return()
    }
    xplot <- xpose.plot.bw(xvardef("cwres",object),
                           xvardef("idv",object),
                           #xlb = xlb,
                           #ylb = ylb,
                                        #scales=list(cex=0.5,tck=0.5),
                           #aspect="fill",
                                  object,#main=list(main,cex=0.7),
                           #main = main,
                           #bins=bins,
                           #ids=FALSE,
                           binvar = xvardef("idv",object),
                                        #xvar = xvardef("cwres",object),
                           #subset=subset,
                           ...)


      return(xplot)
    }
