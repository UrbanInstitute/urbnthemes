# urbnthemes 0.0.1

## Updates because of ggplot2 3.0.0

* Add global options for `scale_continuous_colour()` and `ggplot2.continuous.fill()` to set the palettes to "gradient" instead of "viridis"
* Add `scale_fill_ordinal()` and `scale_colour_ordinal()` because ordered factors now have di

## New functionality

* `set_urbn_defaults()` used to overwrite `scale_*_*()` functions in the global environment. Now, `urbnthemes` intentionally creates package conflicts for `scale_*_*()` functions and resolves them in favor of `urbnthemes` in `set_urbn_defaults()` with the package [conflicted](https://www.tidyverse.org/articles/2018/06/conflicted/). This should be more stable and will limit clutter in the global environemnt. 
* All syntax that included "urban" has been switched to "urbn". This will be the default for any R packages made at the Urban Institute. 
* `colors.R` contains eight `palette_urbn_*` vectors. `palette_urbn_main` contains a named vector with the default palette for the Urban Institute. The remaining `palette_urbn_*` vectors contain continuous color ramps for the shades of the Urban Institute colors. More information is available in the [Urban Institute Data Visualization Style Guide](http://urbaninstitute.github.io/graphics-styleguide/). 
