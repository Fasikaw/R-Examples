## -*- ess-indent-level: 2; ess-basic-offset: 2; tab-width: 8 -*-
##
## Copyright (C) 2014-2015 Roberto Bertolusso and Marek Kimmel
##
## This file is part of XBRL.
##
## XBRL is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 2 of the License, or
## (at your option) any later version.
##
## XBRL is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with XBRL. If not, see <http://www.gnu.org/licenses/>.


xbrlParse <- function(file) {
  .Call("xbrlParse", file, PACKAGE="XBRL")
}
