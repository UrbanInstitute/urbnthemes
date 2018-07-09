#' The Urban Institute [ggplot2] theme
#'
#' Resets all the [ggplot2] theme to its default settings
#'
#'
#' @import extrafont
#' @import ggrepel
#' @import conflicted
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

  # overwrite urbnthemes scale functions so default ggplot2 functions take precedence

  scale_color_discrete <- ggplot2::scale_color_discrete
  scale_colour_discrete <- ggplot2::scale_colour_discrete
  scale_fill_discrete <- ggplot2::scale_fill_discrete
  scale_color_gradientn <- ggplot2::scale_color_gradientn
  scale_colour_gradientn <- ggplot2::scale_colour_gradientn
  scale_fill_gradientn <- ggplot2::scale_fill_gradientn
  scale_fill_ordinal <- ggplot2::scale_fill_ordinal
  scale_colour_ordinal <- ggplot2::scale_colour_ordinal

}
