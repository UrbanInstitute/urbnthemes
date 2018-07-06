#' The Urban Institute [ggplot2] theme
#'
#' Resets all the [ggplot2] theme to its default settings
#'
#'
#' @import extrafont
#' @import ggrepel
#' @md
#' @export

undo_urbn_defaults <- function() {

  # set default theme to theme_urbn_web() ----------------------------------

  ggplot2::theme_set(ggplot2::theme_grey())

  # add Helvetica font to text and label geoms ---------------------------

  ggplot2::update_geom_defaults("text", list(family = "Helvetica"))
  ggplot2::update_geom_defaults("label", list(family = "Helvetica"))
  ggplot2::update_geom_defaults("text_repel", list(family = "Helvetica"))
  ggplot2::update_geom_defaults("label_repel", list(family = "Helvetica"))

  # set default colours for monochromatic geoms -----------------------------

  ggplot2::update_geom_defaults("bar", list(fill = "#595959"))
  ggplot2::update_geom_defaults("col", list(fill = "#595959"))
  ggplot2::update_geom_defaults("point", list(colour = "black"))
  ggplot2::update_geom_defaults("line", list(colour = "#595959"))
  ggplot2::update_geom_defaults("boxplot", list(fill = "#595959"))
  ggplot2::update_geom_defaults("density", list(fill = "#595959"))
  ggplot2::update_geom_defaults("violin", list(fill = "#595959"))

  # set default colours for monochromatic stats -----------------------------

  ggplot2::update_stat_defaults("count", list(fill = "#595959"))
  ggplot2::update_stat_defaults("boxplot", list(fill = "#595959"))
  ggplot2::update_stat_defaults("density", list(fill = "#595959"))
  ggplot2::update_stat_defaults("ydensity", list(fill = "#595959"))

  # set default colors for discrete color scales ----------------------------

  rm(scale_color_discrete, envir = globalenv())
  rm(scale_colour_discrete, envir = globalenv())
  rm(scale_fill_discrete, envir = globalenv())
  rm(scale_fill_gradientn, envir = globalenv())
  rm(scale_color_gradientn, envir = globalenv())
  rm(scale_colour_gradientn, envir = globalenv())

  # redefine default discrete colours, up to 9 colours.

  assign("scale_color_discrete", function(...) saved_scale_color_discrete, envir = globalenv())
  assign("scale_colour_discrete", function(...)  saved_scale_colour_discrete, envir = globalenv())
  assign("scale_fill_discrete", function(...)  saved_scale_fill_discrete, envir = globalenv())

  # set default colors for continuous color scales --------------------------

  assign("scale_fill_gradientn", function(...)  saved_scale_fill_gradientn, envir = globalenv())
  assign("scale_color_gradientn", function(...)  saved_scale_color_gradientn, envir = globalenv())
  assign("scale_colour_gradientn", function(...) saved_scale_colour_gradientn, envir = globalenv())

}
