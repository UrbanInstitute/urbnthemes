#' The Urban Institute [ggplot2] theme
#'
#' Removes tick marks from all axes
#'
#' @md
#' @export
remove_ticks <- function() {
  ggplot2::theme(axis.ticks = element_blank(),
                 axis.ticks.x = element_blank(),
                 axis.ticks.y = element_blank())
}
