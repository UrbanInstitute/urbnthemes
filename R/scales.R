#' The Urban Institute [ggplot2] theme
#'
#' Color palettes used in the Urban Institute.
#'
#' @export
#' @param palette Palette name.
urban_color_pal <- function(palette = "categorical") {
  palette_list <- palette_urban

  types <- palette_list[[palette]]

  function(n) {
    types[[n]]
  }
}

#' Discrete scale color that aligns with the Urban Institute style
#'
#' @md
#' @param palette Urban Institute palette to use. One of \code{categorical} or \code{sequential}
#' @export
scale_color_discrete <- function(...) {
  scale_color_urban(...)
}

#' Discrete scale color that aligns with the Urban Institute style
#'
#' @md
#' @param palette Urban Institute palette to use. One of \code{categorical} or \code{sequential}
#' @export
scale_colour_discrete <- function(...) {
  scale_color_urban(...)
}

#' Discrete scale fill that aligns with the Urban Institute style
#'
#' @md
#' @param palette Urban Institute palette to use. One of \code{categorical} or \code{sequential}
#' @export
scale_fill_discrete <- function(palette = "categorical", ...) {
  scale_fill_urban(...)
}

#' Continuous scale fill that aligns with the Urban Institute style
#'
#' @md
#' @export
scale_color_gradientn <- function(...) {
  scale_color_gradientn_urban(...)
}

#' Continuous scale fill that aligns with the Urban Institute style
#'
#' @md
#' @export
scale_colour_gradientn <- function(...) {
  scale_color_gradientn_urban(...)
}

#' Continuous scale fill that aligns with the Urban Institute style
#'
#' @md
#' @export
scale_fill_gradientn <- function(...) {
  scale_colour_gradientn_urban(...)
}


