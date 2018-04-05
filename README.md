
<!-- README.md is generated from README.Rmd. Please edit that file -->
uithemes
--------

### Overview

`uithemes` is a set of tools for creating Urban Institute themed plots and maps in R. The package extends `ggplot2` by Hadley Wickham with web, print, and map themes as well as tools that make plotting easier at the Urban Institute. `uithemes` replaces the [urban\_R\_theme](https://github.com/UrbanInstitute/urban_R_theme).

### Installation

The only way to install the package is to download this entire directory, open the RStudio project, and click "Install and Restart". Then use `library(uithemes)` to load the package.

![](man/figures/install-and-restart.png)

When this reposiotry is made public, the following will work:

    # Or the development version from GitHub
    # install.packages("devtools")
    devtools::install_github("hadley/tidyverse")

### Usage

-   them\_urban\_web()
-   theme\_urban\_print()
-   set\_urban\_defaults()
-   scale\_color\_urban()
-   scale\_fill\_urban()
-   scale\_gradientn()
-   lato\_test()

### In development

-   urban\_logo\_text()
-   urban\_logo\_image()
-   install\_lato()

-   undo\_urban\_defaults()
-   theme\_urban\_map()
-   save\_urban\_print()
-   save\_urban\_web()
