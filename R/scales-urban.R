#' Color Palettes based on Urban Institute theme
#'
#' Color palettes used in the Urban Institute.
#'
#' @export
#' @param palette Palette name.
urban_color_pal <- function(palette = 'categorical') {
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
scale_color_urban <- function(palette = 'categorical', ...) {
  ggplot2::discrete_scale("colour", "urban", urban_color_pal(palette), ...)
  }

#' Discrete scale fill that aligns with the Urban Institute style
#'
#' @md
#' @param palette Urban Institute palette to use. One of \code{categorical} or \code{sequential}
#' @export
scale_fill_urban <- function(palette = 'categorical', ...) {
  ggplot2::discrete_scale("fill", "urban", urban_color_pal(palette), ...)
  }
