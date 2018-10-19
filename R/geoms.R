#' geom_point in the Urban Institute style
#'
#' Submit `?ggplot2::geom_point` to see the full documentation for `geom_point()`
#'
#' @md
#' @param ... other arguments passed to \code{geom_point()}
#' @export
geom_point <- function(...) {
  ggplot2::geom_point(size = 3, ...)
}

#' geom_line in the Urban Institute style
#'
#' Submit `?ggplot2::geom_line` to see the full documentation for `geom_line()`
#'
#' @md
#' @param ... other arguments passed to \code{geom_line()}
#' @export
geom_line <- function(...) {
  ggplot2::geom_line(size = 1, ...)
}


#' geom_col in the Urban Institute style
#'
#' Submit `?ggplot2::geom_line` to see the full documentation for `geom_col()`
#'
#' @md
#' @param ... other arguments passed to \code{geom_col()}
#' @export
geom_col <- function(...) {
  ggplot2::geom_col(width = 0.7, ...)
}

#' geom_bar in the Urban Institute style
#'
#' Submit `?ggplot2::geom_line` to see the full documentation for `geom_bar()`
#'
#' @md
#' @param ... other arguments passed to \code{geom_bar()}
#' @export
geom_bar <- function(...) {
  ggplot2::geom_bar(width = 0.7, ...)
}
