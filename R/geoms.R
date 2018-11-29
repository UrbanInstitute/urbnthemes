#' geom_bar in the Urban Institute style
#'
#' Submit `?ggplot2::geom_line` to see the full documentation for `geom_bar()`
#'
#' @md
#' @param mapping mapping from ggplot2
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
#' @param ... other arguments passed to \code{geom_col()}
#' @export
geom_col <- function(mapping = NULL, width = 0.7, ...) {
  ggplot2::geom_col(mapping = mapping, width = width, ...)
}

#' geom_jitter in the Urban Institute style
#'
#' Submit `?ggplot2::geom_jitter` to see the full documentation for `geom_jitter()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param ... other arguments passed to \code{geom_jitter()}
#' @export
geom_jitter <- function(mapping = NULL, size = 3, ...) {
  ggplot2::geom_jitter(mapping = mapping, size = size, ...)
}

#' geom_line in the Urban Institute style
#'
#' Submit `?ggplot2::geom_line` to see the full documentation for `geom_line()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param ... other arguments passed to \code{geom_line()}
#' @export
geom_line <- function(mapping = NULL, size = 1, ...) {
  ggplot2::geom_line(mapping = mapping, size = size, ...)
}

#' geom_point in the Urban Institute style
#'
#' Submit `?ggplot2::geom_point` to see the full documentation for `geom_point()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param ... other arguments passed to \code{geom_point()}
#' @export
geom_point <- function(mapping = NULL, size = 3, ...) {
  ggplot2::geom_point(mapping = mapping, size = size, ...)
}

#' geom_point in the Urban Institute style
#'
#' Submit `?ggplot2::geom_point` to see the full documentation for `geom_point()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param ... other arguments passed to \code{geom_point()}
#' @export
geom_text <- function(mapping = NULL, size = 1 / 0.352777778, ...) {
  ggplot2::geom_text(mapping = mapping, size = size, ...)
}
