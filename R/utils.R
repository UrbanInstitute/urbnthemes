#' Set default color for monochromatic plots.
#'
#' Update a set of geoms and stats for monochromatic plots. Defaults to Urban
#' Institute blue #1696d2.
#'
#' @md
#' @param color Color to be set. Defaults to Urban Institute blue #1696d2.
#' @export

set_urban_default <- function(color = '#1696d2') {

  geoms <- c('bar', 'col', 'point', 'line', 'boxplot', 'density', 'violin')
  invisible(
    lapply(geoms,
           function(x) ggplot2::update_geom_defaults(x, list(colour = color)
                                                     )
           )
    )

  stats <- c('count', 'boxplot', 'density', 'ydensity')
  invisible(
    lapply(stats,
           function(x) update_stat_defaults(x, list(colour = color)
                                            )
           )
    )
}
