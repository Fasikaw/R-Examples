# Copyright 2010-2014 Meik Michalke <meik.michalke@hhu.de>
#
# This file is part of the R package koRpus.
#
# koRpus is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# koRpus is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with koRpus.  If not, see <http://www.gnu.org/licenses/>.


#' Readability: Anderson's Readability Index (RIX)
#'
#' This is just a convenient wrapper function for \code{\link[koRpus:readability]{readability}}.
#'
#' This function calculates the Readability Index (RIX) by Anderson, which is a simplified version of the l\"asbarhetsindex (LIX)
#' by Bj\"ornsson. In contrast to \code{\link[koRpus:readability]{readability}},
#' which by default calculates all possible indices, this function will only calculate the index value.
#'
#' This formula doesn't need syllable count.
#'
#' @param txt.file Either an object of class \code{\link[koRpus]{kRp.tagged-class}}, a character vector which must be be
#'    a valid path to a file containing the text to be analyzed, or a list of text features. If the latter, calculation
#'    is done by \code{\link[koRpus:readability.num]{readability.num}}. 
#' @param parameters A numeric vector with named magic numbers, defining the relevant parameters for the index.
#' @param ... Further valid options for the main function, see \code{\link[koRpus:readability]{readability}} for details.
#' @return An object of class \code{\link[koRpus]{kRp.readability-class}}.
# @author m.eik michalke \email{meik.michalke@@hhu.de}
#' @references
#'    Anderson, J. (1981). Analysing the readability of english and non-english texts in the classroom with Lix. In
#'      \emph{Annual Meeting of the Australian Reading Association}, Darwin, Australia.
#'
#'    Anderson, J. (1983). Lix and Rix: Variations on a little-known readability index. \emph{Journal of Reading}, 26(6), 490--496.
#' @keywords readability
#' @export
#' @examples
#' \dontrun{
#'   RIX(tagged.text)
#' }

RIX <- function(txt.file, parameters=c(char=6), ...){
  if(is.list(txt.file)){
    results <- readability.num(txt.features=txt.file, index="RIX", parameters=list(RIX=parameters), ...)
  } else {
    results <- readability(txt.file=txt.file, index="RIX", parameters=list(RIX=parameters), ...)
  }
  return(results)
}
