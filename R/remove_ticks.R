#' The Urban Institute [ggplot2] theme
#'
#' Removes tick marks from all axes
#'
#' @md
#' @export
remove_ticks <- function() {
  ggplot2::theme(axis.ticks = ggplot2::element_blank(),
                 axis.ticks.x = ggplot2::element_blank(),
                 axis.ticks.y = ggplot2::element_blank())
}
