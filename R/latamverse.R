# Latamverse - Latin American Data via RESTful APIs and Curated Datasets
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
#' @import PeruAPIs
NULL

#' Print summary of the Latamverse metapackage
#'
#' This function creates an object containing information about the API packages
#' included in the Latamverse metapackage and their respective versions.
#'
#' @return An object of class "latamverse_info" containing package names and versions.
#' @importFrom cli rule symbol
#' @importFrom utils packageVersion
#' @export
#' @examples
#' \dontrun{
#' # Display Latamverse package information
#' Latamverse()
#'
#' # Store the information in an object
#' info <- Latamverse()
#' print(info)
#' }
Latamverse <- function() {
  pkgs <- c(
    "ArgentinAPI",
    "BrazilDataAPI",
    "ChileDataAPI",
    "ColombiAPI",
    "PeruAPIs"
  )

  versions <- vapply(pkgs, function(pkg) {
    as.character(utils::packageVersion(pkg))
  }, character(1))

  result <- list(
    packages = pkgs,
    versions = versions
  )

  class(result) <- "latamverse_info"
  result
}

#' Print method for latamverse_info objects
#'
#' @param x An object of class "latamverse_info"
#' @param ... Additional arguments (not used)
#' @return Invisibly returns the input object
#' @importFrom cli rule symbol
#' @export
print.latamverse_info <- function(x, ...) {
  message(cli::rule(center = "Welcome to Latamverse", line = 2))
  message("Latin American Countries via RESTful APIs and Curated Datasets.\n")

  pkg_info <- paste0(
    cli::symbol$tick, " ",
    format(x$packages, width = 18),
    " v", x$versions
  )

  message(paste(pkg_info, collapse = "\n"))

  invisible(x)
}

#' @keywords internal
#' @noRd
.onAttach <- function(libname, pkgname) {
  pkgs <- c(
    "ArgentinAPI",
    "BrazilDataAPI",
    "ChileDataAPI",
    "ColombiAPI",
    "PeruAPIs"
  )

  versions <- vapply(pkgs, function(pkg) {
    as.character(utils::packageVersion(pkg))
  }, character(1))

  packageStartupMessage(cli::rule(center = "Welcome to Latamverse", line = 2))
  packageStartupMessage("Latin American Countries via RESTful APIs and Curated Datasets.\n")

  pkg_info <- paste0(cli::symbol$tick, " ", format(pkgs, width = 18), " v", versions)
  lapply(pkg_info, packageStartupMessage)

  invisible(NULL)
}
