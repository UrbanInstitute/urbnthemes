#' The Urban Institute [ggplot2] theme
#'
#' Adds vertical grid lines to plots for scatter plots. This is useful for
#' scatter plots because urbnthemes only supplies horizontal grid lines.
#'
#' @export
#'
scatter_grid <- function() {
  ggplot2::theme(panel.grid.major.x = ggplot2::element_line(colour = "#dedddd"))
}
