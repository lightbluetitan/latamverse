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

# Latamverse


library(testthat)
library(Latamverse)

test_that("Latamverse function returns correct object structure", {
  # Suprimir mensajes durante el test
  result <- suppressMessages(Latamverse())

  # Verificar que retorna un objeto de clase latamverse_info
  expect_s3_class(result, "latamverse_info")

  # Verificar que es una lista con los componentes esperados
  expect_type(result, "list")
  expect_named(result, c("packages", "versions"))

  # Verificar que contiene los 5 paquetes esperados
  expect_length(result$packages, 5)
  expect_length(result$versions, 5)
})

test_that("Latamverse function returns correct package names", {
  result <- suppressMessages(Latamverse())

  # Verificar los nombres correctos de paquetes
  expected_pkgs <- c(
    "ArgentinAPI",
    "BrazilDataAPI",
    "ChileDataAPI",
    "ColombiAPI",
    "PeruAPIs"
  )

  expect_equal(result$packages, expected_pkgs)
  expect_length(result$packages, 5)
})

test_that("Latamverse messages can be suppressed", {
  # CRÍTICO para CRAN: Verificar que los mensajes pueden ser suprimidos
  expect_silent(suppressMessages(Latamverse()))

  # Verificar que aún retorna el objeto correcto
  result <- suppressMessages(Latamverse())
  expect_s3_class(result, "latamverse_info")
})

test_that(".onAttach function exists and is properly defined", {
  # Verificar que .onAttach existe como función en el namespace
  expect_true(exists(".onAttach", envir = asNamespace("Latamverse")))

  # Verificar que es una función
  onattach_func <- get(".onAttach", envir = asNamespace("Latamverse"))
  expect_true(is.function(onattach_func))

  # Verificar que tiene los argumentos correctos
  args <- formals(onattach_func)
  expect_true("libname" %in% names(args))
  expect_true("pkgname" %in% names(args))
})

test_that("Package list is consistent and complete", {
  result <- suppressMessages(Latamverse())

  # Verificar que contiene exactamente 5 paquetes
  expect_length(result$packages, 5)
  expect_length(result$versions, 5)

  # Todos deben ser character strings válidos
  expect_true(all(is.character(result$packages)))
  expect_true(all(is.character(result$versions)))
  expect_true(all(nchar(result$packages) > 0))
  expect_true(all(nchar(result$versions) > 0))

  # Verificar nombres específicos esperados
  expected_names <- c("ArgentinAPI", "BrazilDataAPI", "ChileDataAPI",
                      "ColombiAPI", "PeruAPIs")
  expect_setequal(result$packages, expected_names)
})

test_that("Version numbers are properly formatted", {
  result <- suppressMessages(Latamverse())

  # Verificar que las versiones tienen formato válido (x.y.z)
  version_pattern <- "^[0-9]+\\.[0-9]+\\.[0-9]+$"
  expect_true(all(grepl(version_pattern, result$versions)),
              "All versions should follow x.y.z format")
})

test_that("Print method exists and works", {
  result <- suppressMessages(Latamverse())

  # Verificar que el método print existe y funciona sin errores
  expect_error(suppressMessages(print(result)), NA)
})

test_that("Print method returns invisibly", {
  result <- suppressMessages(Latamverse())

  # Verificar que print retorna invisiblemente
  expect_invisible(print(result))

  # Verificar que retorna el mismo objeto
  returned <- suppressMessages(print(result))
  expect_identical(returned, result)
})

test_that("Function output is consistent across multiple calls", {
  # Ejecutar múltiples veces para verificar consistencia
  result1 <- suppressMessages(Latamverse())
  result2 <- suppressMessages(Latamverse())

  # Los resultados deben ser idénticos
  expect_equal(result1$packages, result2$packages)
  expect_equal(result1$versions, result2$versions)
})

test_that("Function executes without errors", {
  # Verificar que la función se ejecuta sin errores
  expect_error(suppressMessages(Latamverse()), NA)
})

test_that("Object structure allows data extraction", {
  result <- suppressMessages(Latamverse())

  # Verificar que se puede acceder a los componentes
  expect_no_error(result$packages)
  expect_no_error(result$versions)

  # Verificar que los componentes son vectores
  expect_vector(result$packages)
  expect_vector(result$versions)

  # Verificar que tienen nombres como atributo del vector versions
  expect_true(is.character(names(result$versions)))
})

test_that("Package names are valid R package identifiers", {
  result <- suppressMessages(Latamverse())

  # Verificar que todos son nombres válidos de paquetes R
  expect_true(all(grepl("^[A-Za-z][A-Za-z0-9.]*[A-Za-z0-9]$", result$packages)))
})

test_that("Function can be called multiple times without errors", {
  # Verificar que múltiples llamadas funcionan
  expect_no_error(suppressMessages(Latamverse()))
  expect_no_error(suppressMessages(Latamverse()))
  expect_no_error(suppressMessages(Latamverse()))
})

test_that("Return value is not NULL", {
  result <- suppressMessages(Latamverse())

  # Verificar que no retorna NULL
  expect_false(is.null(result))

  # Verificar que tiene contenido
  expect_true(length(result) > 0)
})

test_that("Packages and versions have matching lengths", {
  result <- suppressMessages(Latamverse())

  # Verificar que cada paquete tiene su versión correspondiente
  expect_equal(length(result$packages), length(result$versions))
})

test_that("All expected packages are present", {
  result <- suppressMessages(Latamverse())

  # Lista completa de paquetes esperados
  all_expected <- c("ArgentinAPI", "BrazilDataAPI", "ChileDataAPI",
                    "ColombiAPI", "PeruAPIs")

  # Verificar que todos están presentes
  expect_true(all(all_expected %in% result$packages))

  # Verificar que no hay paquetes extra
  expect_equal(length(result$packages), 5)
})

test_that("Object can be converted to data frame", {
  result <- suppressMessages(Latamverse())

  # Verificar que se puede crear un data frame con la información
  df <- data.frame(
    package = result$packages,
    version = result$versions,
    stringsAsFactors = FALSE
  )

  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), 5)
  expect_equal(ncol(df), 2)
})
