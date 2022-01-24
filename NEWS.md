# urbnthemes 0.0.3

* Change `lato_install()` to `lato_import()` and use `library(systemfonts)` to resolve issues across operating systems. 
* Set default color (`"white"`) and size (`0.1`) for `geom_sf()`. 
* Deprecate `lato_install()` as the function name was misleading. Users have to manually install Lato on their computer
  first before importing the font into R with `lato_import()`.
* Add helpful error message when there are more than 8 groups for `fill` and
  `color` operations.
* Add `urbn_save()` function to export images in some default small, medium, and
  large sizes which will work well in Urban publications. 
* Move `geom_*()` defaults from geoms.R to `ggplot2::update_geom_defaults()` in `set_urbn_defaults()`. 
  If you want to set size to be an aesthetic mapping say in `geom_point()`, you no longer need to call `ggplot2::geom_point()`.
  Now you can just use `geom_point()` from `library(ggplot2)` for everything.
* Fixed an error with `urbn_geofact()` so it works with `library(geofacet)`.
* Updated documentation to clarify functions.
* Overwrote `scale_*_ordinal()` to use Urban Institute colors.

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

