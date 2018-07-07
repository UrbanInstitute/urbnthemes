#' The Urban Institute [ggplot2] theme
#'
#' \code{set_urbn_defaults} provides a [ggplot2] theme formatted according to the
#' Urban Institute style guide for web, with sensible defaults.
#'
#' @param style The default theme style for the R session. "web", "print", or "map".
#' @import extrafont
#' @import ggrepel
#' @import conflicted
#' @md
#' @export
set_urbn_defaults <- function(style = "print") {

  # set deault theme to theme_urbn_*() --------------------------------------

  if (style == "print") {
    ggplot2::theme_set(theme_urbn_print())
  } else if (style == "web") {
    ggplot2::theme_set(theme_urbn_web())
  } else if (style == "map") {
    ggplot2::theme_set(theme_urbn_map())
  }

  # add Lato font to text and label geoms ---------------------------

  ggplot2::update_geom_defaults("text", list(family = "Lato"))
  ggplot2::update_geom_defaults("label", list(family = "Lato"))
  ggplot2::update_geom_defaults("text_repel", list(family = "Lato"))
  ggplot2::update_geom_defaults("label_repel", list(family = "Lato"))

  # set default color scales for continuous variables -----------------------

  options(
    ggplot2.continuous.colour = "gradient",
    ggplot2.continuous.fill = "gradient"
  )

  # set default colors for monochromatic geoms ------------------------------

  ggplot2::update_geom_defaults("bar", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("col", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("point", list(colour = "#1696d2"))
  ggplot2::update_geom_defaults("line", list(colour = "#1696d2"))
  ggplot2::update_geom_defaults("boxplot", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("density", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("violin", list(fill = "#1696d2"))

  # set default colors for monochromatic stats ------------------------------

  ggplot2::update_stat_defaults("count", list(fill = "#1696d2"))
  ggplot2::update_stat_defaults("boxplot", list(fill = "#1696d2"))
  ggplot2::update_stat_defaults("density", list(fill = "#1696d2"))
  ggplot2::update_stat_defaults("ydensity", list(fill = "#1696d2"))

  # overwrite default scale functions so Urban Institute colors are part of the
  # default ggplot2 functionality

  scale_color_discrete <- urbnthemes::scale_color_discrete
  scale_colour_discrete <- urbnthemes::scale_colour_discrete
  scale_fill_discrete <- urbnthemes::scale_fill_discrete
  scale_color_gradientn <- urbnthemes::scale_color_gradientn
  scale_colour_gradientn <- urbnthemes::scale_colour_gradientn
  scale_fill_gradientn <- urbnthemes::scale_fill_gradientn
  scale_fill_ordinal <- urbnthemes::scale_fill_ordinal
  scale_colour_ordinal <- urbnthemes::scale_colour_ordinal
}
