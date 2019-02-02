# urbnthemes 0.0.1

## Updates because of ggplot2 3.0.0

* Add global options for `scale_continuous_colour()` and `ggplot2.continuous.fill()` to set the palettes to "gradient" instead of "viridis"
* Add `scale_fill_ordinal()` and `scale_colour_ordinal()` because ordered factors now have different scale functions.

## New functionality

* All syntax that included "urban" has been switched to "urbn". This will be the default for any R packages made at the Urban Institute. 
* `colors.R` contains eleven `palette_urbn_*` vectors. More information is available in the [Urban Institute Data Visualization Style Guide](http://urbaninstitute.github.io/graphics-styleguide/). 
    * `palette_urbn_main` is the eight color discrete palette of the Urban Institute with cyan, yellow, black, gray, magenta, green, space gray, and red. 
    * `palette_urbn_diverging` is an eight color diverging palette. 
    * `palette_urbn_quintile` is a five color blue palette that is good for quintiles. 
    * `palette_urbn_politics` is a two color palette with blue for Democrats and red for Republicans. 
    * `palette_urbn_cyan`
    * `palette_urbn_gray`
    * `palette_urbn_yellow`
    * `palette_urbn_magenta`
    * `palette_urbn_green`
    * `palette_urbn_spacegray`
    * `palette_urbn_red`

