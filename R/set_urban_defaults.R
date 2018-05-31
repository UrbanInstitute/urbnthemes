#' The Urban Institute [ggplot2] theme
#'
#' \code{set_urban_defaults} provides a [ggplot2] theme formatted according to the
#' Urban Institute style guide for web, with sensible defaults.
#'
#' @param style The default theme style for the R session. "web", "print", or "map".
#' @import extrafont
#' @import ggrepel
#' @md
#' @export
set_urban_defaults <- function(style = "print") {

  # set default theme to theme_urban_web() ----------------------------------

  if (style == "print") {
    ggplot2::theme_set(theme_urban_print())
  } else if (style == "print") {
    ggplot2::theme_set(theme_urban_web())
  } else if (style == "map") {
    ggplot2::theme_set(theme_urban_map())
  }

  # add Lato font to text and label geoms ---------------------------

  ggplot2::update_geom_defaults("text", list(family = "Lato"))
  ggplot2::update_geom_defaults("label", list(family = "Lato"))
  ggplot2::update_geom_defaults("text_repel", list(family = "Lato"))
  ggplot2::update_geom_defaults("label_repel", list(family = "Lato"))

  # set default colours for monochromatic geoms -----------------------------

  ggplot2::update_geom_defaults("bar", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("col", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("point", list(colour = "#1696d2"))
  ggplot2::update_geom_defaults("line", list(colour = "#1696d2"))
  ggplot2::update_geom_defaults("boxplot", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("density", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("violin", list(fill = "#1696d2"))

  # set default colours for monochromatic stats -----------------------------

  ggplot2::update_stat_defaults("count", list(fill = "#1696d2"))
  ggplot2::update_stat_defaults("boxplot", list(fill = "#1696d2"))
  ggplot2::update_stat_defaults("density", list(fill = "#1696d2"))
  ggplot2::update_stat_defaults("ydensity", list(fill = "#1696d2"))

  # set default colors for discrete color scales ----------------------------

  # save
  assign("saved_scale_color_discrete", function(...) ggplot2::scale_color_discrete(...), envir = globalenv())
  assign("saved_scale_colour_discrete", function(...) ggplot2::scale_colour_discrete(...), envir = globalenv())
  assign("saved_scale_fill_discrete", function(...) ggplot2::scale_fill_discrete(...), envir = globalenv())

  # save default colors for continuous color scales --------------------------

  assign("saved_scale_fill_gradientn", function(...)  ggplot2::scale_fill_gradientn(...), envir = globalenv())
  assign("saved_scale_color_gradientn", function(...)  ggplot2::scale_color_gradientn(...), envir = globalenv())
  assign("saved_scale_colour_gradientn", function(...) ggplot2::scale_colour_gradientn(...), envir = globalenv())

  # redefine default discrete colours, up to 9 colours.

  scale_color_discrete <- function(...) scale_color_urban()
  #assign("scale_color_discrete", function(...) scale_color_urban(...), envir = globalenv())
  assign("scale_colour_discrete", function(...)  scale_color_urban(...), envir = globalenv())
  assign("scale_fill_discrete", function(...)  scale_fill_urban(...), envir = globalenv())

  # set default colors for continuous color scales --------------------------

  assign("scale_fill_gradientn", function(...)  scale_fill_gradientn_urban(...), envir = globalenv())
  assign("scale_color_gradientn", function(...)  scale_color_gradientn_urban(...), envir = globalenv())
  assign("scale_colour_gradientn", function(...) scale_colour_gradientn_urban(...), envir = globalenv())

}
