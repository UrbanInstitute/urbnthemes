#' geom_bar in the Urban Institute style
#'
#' Submit `?ggplot2::geom_line` to see the full documentation for `geom_bar()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param width bar width
#' @param ... other arguments passed to \code{geom_bar()}
#' @export
geom_bar <- function(mapping = NULL, width = 0.7, ...) {
  ggplot2::geom_bar(mapping = mapping, width = width, ...)
}

#' geom_col in the Urban Institute style
#'
#' Submit `?ggplot2::geom_line` to see the full documentation for `geom_col()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param width column width
#' @param ... other arguments passed to \code{geom_col()}
#' @export
geom_col <- function(mapping = NULL, width = 0.7, ...) {
  ggplot2::geom_col(mapping = mapping, width = width, ...)
}
