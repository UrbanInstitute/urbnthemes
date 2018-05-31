update_geom_defaults <- function() {

  # add lato font to text and label geoms ---------------------------

  ggplot2::update_geom_defaults("text", list(family = "Lato"))
  ggplot2::update_geom_defaults("label", list(family = "Lato"))
  ggplot2::update_geom_defaults("text_repel", list(family = "Lato"))
  ggplot2::update_geom_defaults("label_repel", list(family = "Lato"))

  # set default colours for monochromatic plots -----------------------------

  ggplot2::update_geom_defaults("bar", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("point", list(colour = "#1696d2"))
  ggplot2::update_geom_defaults("line", list(colour = "#1696d2"))
  ggplot2::update_geom_defaults("boxplot", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("density", list(fill = "#1696d2"))
  ggplot2::update_geom_defaults("violin", list(fill = "#1696d2"))

}
