
<!-- README.md is generated from README.Rmd. Please edit that file -->

# urbnthemes <a href="https://UrbanInstitute.github.io/urbnthemes/"><img src="man/figures/hexsticker.png" align="right" height="160"/></a>

## Overview

`urbnthemes` is a set of tools for creating Urban Institute-themed plots
and maps in R. The package extends `ggplot2` with print and map themes
as well as tools that make plotting easier at the Urban Institute.

A comprehensive set of examples is available at the [Urban Institute R
Users Group
website](https://UrbanInstitute.github.io/r-at-urban/graphics-guide.html).

## Stay up-to-date

Sign up
[here](https://app.smartsheet.com/b/form/9029a0a8254e4044a52cdebaebe343bf)
to stay up-to-date with R package releases and R resources from the
Urban Institute. We will not share your information and we will not
email more than once per month.

## Installation

    install.packages("remotes")
    remotes::install_github("UrbanInstitute/urbnthemes", build_vignettes = TRUE)

## Fonts

The Urban Institute uses [Lato](https://fonts.google.com/specimen/Lato)
font for publications. After installing `urbnthemes`, submit
`urbnthemes::lato_test()` to see if Lato is imported and registered.

If Lato isn’t imported and registered, install
[Lato](https://fonts.google.com/specimen/Lato) and then submit
`urbnthemes::lato_import()`. If you are on a Windows, you may need to
install [ghostscript](https://www.ghostscript.com/download.html) and
then submit `Sys.setenv(R_GSCMD = "link to the ghostscript .exe")`
before running `urbnthemes::lato_import()`.

Waffle charts with glyphs require fontawesome. `fontawesome_test()` and
`fontawesome_install()` are the fontawesome versions of the above
functions. Be sure to install fontawesome from
[here](https://github.com/hrbrmstr/waffle/tree/master/inst/fonts).

## Usage

Always load `library(urbnthemes)` after `library(ggplot2)` or
`library(tidyverse)`.

``` r
library(tidyverse)
library(urbnthemes)

set_urbn_defaults(style = "print")

ggplot(data = mtcars, mapping = aes(factor(cyl))) +
  geom_bar() + 
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(x = "Number of Cylinders",
       y = "Count") +
  remove_ticks() +
  labs(title = "Most Cars Have 8 Cylinders",
       subtitle = "1974 Motor Trend US magazine")
```

![](man/figures/README-basic-example-1.png)<!-- -->

``` r
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  scale_x_continuous(expand = expansion(mult = c(0.002, 0)), 
                     limits = c(0, 6),
                     breaks = 0:6) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.002)), 
                     limits = c(0, 40),
                     breaks = 0:8 * 5) +
  labs(x = "Weight (thousands of pounds)",
       y = "City MPG") +
  scatter_grid()
```

![](man/figures/README-scatter-plot-1-1.png)<!-- -->

``` r
mtcars %>%
  mutate(cyl = paste(cyl, "cylinders")) %>%
  ggplot(aes(x = wt, y = mpg, color = cyl)) +
  geom_point() +
  scale_x_continuous(expand = expansion(mult = c(0.002, 0)), 
                     limits = c(0, 6),
                     breaks = 0:6) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.002)), 
                     limits = c(0, 40),
                     breaks = 0:8 * 5) +
  labs(x = "Weight (thousands of pounds)",
       y = "City MPG") +
  scatter_grid()
```

![](man/figures/README-scatter-plot-2-1.png)<!-- -->

``` r
library(gapminder)

gapminder %>%
  filter(country %in% c("Australia", "Canada", "New Zealand")) %>%
  mutate(country = factor(country, levels = c("Canada", "Australia", "New Zealand"))) %>%
  ggplot(aes(year, gdpPercap, color = country)) +
  geom_line() +
  scale_x_continuous(expand = expansion(mult = c(0.002, 0)), 
                     breaks = c(1952 + 0:12 * 5), 
                     limits = c(1952, 2007)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.002)), 
                     breaks = 0:8 * 5000,
                     labels = scales::dollar, 
                     limits = c(0, 40000)) +
  labs(x = "Year",
       y = "Per capita GDP (US dollars)")
```

![](man/figures/README-line-plot-1.png)<!-- -->

``` r
txhousing %>%
  filter(city %in% c("Austin","Houston","Dallas","San Antonio","Fort Worth")) %>%
  group_by(city, year) %>%
  summarize(sales = sum(sales)) %>%
  ggplot(aes(x = year, y = sales, fill = city)) +
  geom_area(position = "stack") +
  scale_x_continuous(expand = expansion(mult = c(0, 0)),
                     limits = c(2000, 2015),
                     breaks = 2000 + 0:15) +  
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)), 
                     labels = scales::comma) +
  labs(x = "Year",
       y = "Home sales")
```

    #> `summarise()` has grouped output by 'city'. You can override using the `.groups` argument.

![](man/figures/README-area-plot-1.png)<!-- -->

## Branding

``` r
library(ggplot2)
library(urbnthemes)

set_urbn_defaults()

plot <- ggplot(data = mtcars, mapping = aes(factor(cyl))) +
  geom_bar() + 
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(x = "Number of Cylinders",
       y = "Count") +
  remove_ticks()

urbn_plot(plot, urbn_logo_text(), ncol = 1, heights = c(30, 1))
```

![](man/figures/README-branding-1.png)<!-- -->

## Notes and Sources

``` r
library(ggplot2)
library(urbnthemes)

set_urbn_defaults()

plot <- ggplot(data = mtcars, mapping = aes(factor(cyl))) +
  geom_bar() + 
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(x = "Number of Cylinders",
       y = NULL) +
  remove_ticks()

urbn_plot(
  urbn_y_title(string = "Count"),
  plot, 
  urbn_logo_text(), 
  urbn_source(text = "This is a long source. This is a long source. This is a long source. This is a long source. This is a long source. This is a long source. This is a long source. ",
              width = 155),
  urbn_note(text = "This is a long note. This is a long note. This is a long note. This is a long note. This is a long note. This is a long note. This is a long note. This is a long note.",
            width = 155,
            plural = TRUE),
  ncol = 1, 
  heights = c(1, 30, 1.5, 2.5, 2.5)
)
```

![](man/figures/README-notes-and-sources-1.png)<!-- -->

Core themes:

-   `set_urbn_defaults()`
-   `theme_urbn_print()`
-   `theme_urbn_map()`

Formatting functions:

-   `urbn_plot()`
-   `urbn_title()`
-   `urbn_subtitle()`
-   `urbn_y_title()`
-   `urbn_note()`
-   `urbn_source()`
-   `urbn_logo_text()`
-   `scatter_grid()`
-   `remove_ticks()`
-   `add_axis()`
-   `remove_axis()`
-   `get_legend()`
-   `remove_legend()`
-   `urbn_geofacet`

Palette functions:

-   `palette_urbn_main`
-   `palette_urbn_diverging`
-   `palette_urbn_quintile`
-   `palette_urbn_politics`
-   `palette_urbn_cyan`
-   `palette_urbn_gray`
-   `palette_urbn_yellow`
-   `palette_urbn_magenta`
-   `palette_urbn_green`
-   `palette_urbn_spacegray`
-   `palette_urbn_red`

Utility functions:


  - `lato_test()`
  - `lato_import()`
  - `fontawesome_test()`
  - `fontawesome_install()`
  - `view_palette()`

In development:

-   `undo_urbn_defaults()`
-   `save_urbn_print()`

## Getting help

Contact [Aaron R. Williams](awilliams@urban.org) or [Kyle
Ueyama](kueyama@urban.org) with feedback or questions.

## Code of conduct

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
