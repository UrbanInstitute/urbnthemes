#' The Urban Institute [ggplot2] theme
#'
#' Color palettes used in the Urban Institute.
#'
#' @export
#' @param palette Palette name.
urbn_color_pal <- function(palette = "categorical") {
  palette_list <- palette_urbn

  types <- palette_list[[palette]]

  function(n) {
    types[[n]]
  }
}

#' Discrete color scale that aligns with the Urban Institute style
#'
#' @md
#' @param palette Urban Institute palette to use. One of \code{categorical} or \code{sequential}
#' @export
scale_color_discrete <- function(...) {
  ggplot2::discrete_scale("colour", "urbn", urbn_color_pal("categorical"), ...)
}

#' Discrete color scale that aligns with the Urban Institute style
#'
#' @md
#' @param palette Urban Institute palette to use. One of \code{categorical} or \code{sequential}
#' @export
scale_colour_discrete <- function(...) {
  ggplot2::discrete_scale("colour", "urbn", urbn_color_pal("categorical"), ...)
}

#' Discrete fill scale that aligns with the Urban Institute style
#'
#' @md
#' @param palette Urban Institute palette to use. One of \code{categorical} or \code{sequential}
#' @export
scale_fill_discrete <- function(...) {
  ggplot2::discrete_scale("fill", "urbn", urbn_color_pal("categorical"), ...)
}

#' Continuous fill scale that aligns with the Urban Institute style
#'
#' @md
#' @export
scale_color_gradientn <- function(...,
                                  colours = c("#CFE8F3","#A2D4EC","#73BFE2","#46ABDB", "#1696D2","#12719E","#0A4C6A","#062635"),
                                  colors = c("#CFE8F3","#A2D4EC","#73BFE2","#46ABDB", "#1696D2","#12719E","#0A4C6A","#062635"),
                                  values = NULL,
                                  space = "Lab",
                                  na.value = "grey50",
                                  guide = "colourbar") {

  colours <- if (missing(colours)) colors else colours

  continuous_scale("colour", "gradientn",
                   scales::gradient_n_pal(colours, values, space), na.value = na.value, guide = guide, ...)
}

#' Continuous fill scale that aligns with the Urban Institute style
#'
#' @md
#' @export
scale_colour_gradientn <- scale_color_gradientn

#' Continuous fill scale that aligns with the Urban Institute style
#'
#' @md
#' @export
scale_fill_gradientn <- function(...,
                                 colours = c("#CFE8F3","#A2D4EC","#73BFE2","#46ABDB", "#1696D2","#12719E","#0A4C6A","#062635"),
                                 colors = c("#CFE8F3","#A2D4EC","#73BFE2","#46ABDB", "#1696D2","#12719E","#0A4C6A","#062635"),
                                 values = NULL,
                                 space = "Lab",
                                 na.value = "grey50",
                                 guide = "colourbar") {

  colours <- if (missing(colours)) colors else colours

  continuous_scale("fill", "gradientn",
                   scales::gradient_n_pal(colours, values, space), na.value = na.value, guide = guide, ...)
}

#' Discrete fill scale for ordinal factors that aligns with the Urban Institute style
#'
#' @md
#' @export
scale_fill_ordinal <- scale_color_discrete

#' Discrete color scale for ordinal factors that aligns with the Urban Institute style
#'
#' @md
#' @export
scale_colour_ordinal <- scale_color_discrete
