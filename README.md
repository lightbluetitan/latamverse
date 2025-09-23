# Latamverse

The **`Latamverse`** is a metapackage that brings together a comprehensive collection of R packages providing access to APIs functions and curated datasets from **Argentina**, **Brazil**, **Chile**, **Colombia**, and **Peru**. It integrates both real-time and historical data retrieved through public RESTful APIs, such as *Nager.Date*, *World Bank API*, and *REST Countries API*, while also offering extensive curated collections of open datasets covering economics, demographics, public health, environmental data, political indicators, social metrics, and cultural information.  

## Installation

To install the `Latamverse` package, use the following:

```r 

# Install from CRAN 

install.packages("Latamverse")

# Then load the package:

library(Latamverse)


```

## Using the Latamverse() Function

Once the package is loaded, you can call the **Latamverse()** function to display the list of included packages and their versions:

```r 

Latamverse()

```


## Important Note on Detaching Packages

`Latamverse` imports and depends on several subpackages. Therefore, you cannot detach an individual subpackage (like `PeruAPIs`) while **Latamverse** is still loaded.

### Example of an Error


```r 

# This will raise an error

detach("package:PeruAPIs", unload = TRUE)

```

## Correct Way to Detach

To properly unload a subpackage, you must first detach `Latamverse`:

```r

# First detach the metapackage

detach("package:Latamverse", unload = TRUE)

# Now you can safely detach the subpackage

detach("package:PeruAPIs", unload = TRUE)

```

By installing the `Latamverse` package this will attach the following packages to your R session:

- `ArgentinAPI`

- `BrazilDataAPI`

- `ChileDataAPI`

- `ColombiAPI`

- `PeruAPIs`

## Included Packages in the Latamverse


### ArgentinAPI

The `ArgentinAPI` package provides a comprehensive and unified interface to access open data about **Argentina** from multiple public RESTful APIs, including **ArgentinaDatos API**, **REST Countries API**, and **World Bank API**. Through these sources, users can easily retrieve information on exchange rates, inflation, political figures, national holidays, economic indicators, and general country-level statistics.


### BrazilDataAPI

The `BrazilDataAPI` package provides a unified interface to access open data from the **BrasilAPI**, **REST Countries API**, **Nager.Date API**, and **World Bank API**, with a focus on **Brazil**. It allows users to easily retrieve up-to-date information on postal codes, banks, economic indicators, holidays, company registrations, international country-level data, public holidays information, and economic development data relevant to *Brazil*.


### ChileDataAPI

The `ChileDataAPI` package provides a unified interface to access open data from multiple public RESTful APIs, including the **FINDIC API**, the **REST Countries API**, the **World Bank API**, and **Nager.Date**. With a focus on **Chile**, the package enables users to retrieve real-time or historical data such as financial indicators (**UF, UTM, Dollar, Euro, Yen, Copper price per pound, Bitcoin, IPSA index**), holidays, and international demographic and geopolitical information.  


### ColombiAPI

The `ColombiAPI` package provides a unified interface to access open data from the **API-Colombia**, **World Bank API**, **Nager.Date API**, and the **REST Countries API**, with a focus on **Colombia**. It allows users to retrieve up-to-date or historical information on topics such as geographic locations, cultural attractions, economic indicators, demographic data, national holidays, and key country-level details.


### PeruAPIs

The `PeruAPIs` package provides a unified interface to access open data from the **World Bank API**, **Nager.Date API**, and the **REST Countries API**, with a focus on **Peru**. It allows users to retrieve up-to-date or historical information on topics such as economic indicators, demographics, national holidays, and key geopolitical details.
