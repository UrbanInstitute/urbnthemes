#' The Urban Institute [ggplot2] theme
#'
#' Adds vertical grid lines to plots for scatter plots
#'
#' @md
#' @export
scatter_grid <- function() {
  ggplot2::theme(panel.grid.major.x = ggplot2::element_line(colour = "#dedddd"))
}
