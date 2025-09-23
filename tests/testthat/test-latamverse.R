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

test_that("Latamverse function returns correct package names invisibly", {
  # Capturar output para evitar que se imprima durante las pruebas
  result <- capture.output(invisible_result <- Latamverse())

  # Verificar que retorna los nombres correctos de paquetes (5, sin México)
  expected_pkgs <- c(
    "ArgentinAPI",
    "BrazilDataAPI",
    "ChileDataAPI",
    "ColombiAPI",
    "PeruAPIs"  # Sin MexicoDataAPI
  )

  expect_equal(invisible_result, expected_pkgs)
  expect_length(invisible_result, 5)  # Cambiado de 6 a 5
})

test_that("Latamverse function produces expected output structure", {
  # Capturar todo el output
  output <- capture.output(Latamverse())

  # Verificar que contiene elementos esperados del mensaje
  expect_true(any(grepl("Welcome to Latamverse", output)))
  expect_true(any(grepl("Metapackage for Latin American Countries", output)))

  # Verificar que menciona cada paquete (5, sin México)
  expected_pkgs <- c("ArgentinAPI", "BrazilDataAPI", "ChileDataAPI",
                     "ColombiAPI", "PeruAPIs")  # Sin MexicoDataAPI

  for (pkg in expected_pkgs) {
    expect_true(any(grepl(pkg, output)),
                info = paste("Package", pkg, "should appear in output"))
  }
})

test_that("Latamverse function shows package information", {
  output <- capture.output(Latamverse())

  # Debe mostrar información de los paquetes
  expect_true(length(output) > 3, "Should produce substantial output")

  # Debe mostrar versiones
  expect_true(any(grepl("v", output)), "Should show version numbers")
})

test_that("Latamverse function handles output formatting", {
  output <- capture.output(Latamverse())

  # Verificar que produce output sustancial
  expect_true(length(output) > 5, "Should produce substantial output")

  # Verificar que hay líneas no vacías
  non_empty_lines <- sum(nchar(trimws(output)) > 0)
  expect_true(non_empty_lines >= 5, "Should have multiple non-empty lines")
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
  # Verificar que la lista de paquetes es consistente
  output <- capture.output(result <- Latamverse())

  # Debe retornar exactamente 5 paquetes (cambiado de 6)
  expect_length(result, 5)

  # Todos deben ser character strings válidos
  expect_true(all(is.character(result)))
  expect_true(all(nchar(result) > 0))

  # Verificar nombres específicos esperados (sin México)
  expected_names <- c("ArgentinAPI", "BrazilDataAPI", "ChileDataAPI",
                      "ColombiAPI", "PeruAPIs")  # Sin MexicoDataAPI
  expect_setequal(result, expected_names)
})

test_that("Function output contains expected package names", {
  output <- capture.output(Latamverse())
  output_text <- paste(output, collapse = " ")

  # Cada paquete debe aparecer en el output (5 paquetes, sin México)
  packages_to_check <- c("ArgentinAPI", "BrazilDataAPI", "ChileDataAPI",
                         "ColombiAPI", "PeruAPIs")  # Sin MexicoDataAPI

  for (pkg in packages_to_check) {
    expect_true(grepl(pkg, output_text),
                info = paste("Package", pkg, "should appear in output"))
  }
})

test_that("Output contains proper welcome message", {
  output <- capture.output(Latamverse())
  output_text <- paste(output, collapse = " ")

  # Verificar elementos clave del mensaje
  expect_true(grepl("Welcome to Latamverse", output_text))
  expect_true(grepl("Metapackage", output_text))
  expect_true(grepl("Latin American", output_text))
})

test_that("Function returns invisibly", {
  # Verificar que la función efectivamente retorna de forma invisible
  expect_invisible(Latamverse())
})

test_that("Output structure is consistent", {
  # Ejecutar múltiples veces para verificar consistencia
  output1 <- capture.output(result1 <- Latamverse())
  output2 <- capture.output(result2 <- Latamverse())

  # Los resultados deben ser consistentes
  expect_equal(result1, result2)
  expect_equal(length(output1), length(output2))
})

test_that("Function handles cli symbols gracefully", {
  output <- capture.output(Latamverse())

  # La función debería ejecutarse sin errores relacionados con cli
  expect_true(length(output) > 0)

  # Debería contener al menos los nombres de paquetes
  expect_true(any(grepl("ArgentinAPI", output)))
  expect_true(any(grepl("PeruAPIs", output)))
})

test_that("Return value contains expected package structure", {
  result <- suppressMessages(capture.output(packages <- Latamverse()))

  # Verificar estructura del valor retornado
  expect_is(packages, "character")
  expect_named(packages, NULL)  # Vector sin nombres

  # Verificar que todos son nombres válidos de paquetes
  expect_true(all(grepl("^[A-Za-z][A-Za-z0-9]*[A-Za-z0-9]*$", packages)))

  # Verificar que son exactamente 5 paquetes
  expect_length(packages, 5)
})
