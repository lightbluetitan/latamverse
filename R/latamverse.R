# Latamverse - A Metapackage for Latin American Countries via RESTful APIs and Curated Datasets
# Version 0.1.0
# Copyright (C) 2025 Renzo Caceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#' @import ArgentinAPI
#' @import BrazilDataAPI
#' @import ChileDataAPI
#' @import ColombiAPI
#' @import MexicoDataAPI
#' @import PeruAPIs
NULL

#' Print summary of the Latamverse metapackage
#'
#' This function displays a formatted list of the API packages included
#' in the Latamverse metapackage and their respective versions.
#'
#' @return Invisibly returns the names of the loaded packages.
#' @importFrom cli rule symbol
#' @importFrom utils packageVersion
#' @export
Latamverse <- function() {
  pkgs <- c(
    "ArgentinAPI",
    "BrazilDataAPI",
    "ChileDataAPI",
    "ColombiAPI",
    "MexicoDataAPI",
    "PeruAPIs"
  )

  cat(cli::rule(center = "Welcome to Latamverse", line = 2), "\n")
  cat("A Metapackage for Latin American Countries via RESTful APIs and Curated Datasets.\n\n")

  versions <- vapply(pkgs, function(pkg) {
    as.character(utils::packageVersion(pkg))
  }, character(1))

  pkg_info <- paste0(cli::symbol$tick, " ", format(pkgs, width = 18), " v", versions)
  cat(paste(pkg_info, collapse = "\n"), "\n")

  invisible(pkgs)
}

#' @keywords internal
#' @noRd
.onAttach <- function(libname, pkgname) {
  pkgs <- c(
    "ArgentinAPI",
    "BrazilDataAPI",
    "ChileDataAPI",
    "ColombiAPI",
    "MexicoDataAPI",
    "PeruAPIs"
  )

  versions <- vapply(pkgs, function(pkg) {
    as.character(utils::packageVersion(pkg))
  }, character(1))

  packageStartupMessage(cli::rule(center = "Welcome to Latamverse", line = 2))
  packageStartupMessage("A Metapackage for Latin American Countries via RESTful APIs and Curated Datasets.\n")

  pkg_info <- paste0(cli::symbol$tick, " ", format(pkgs, width = 18), " v", versions)
  lapply(pkg_info, packageStartupMessage)

  invisible(NULL)
}
