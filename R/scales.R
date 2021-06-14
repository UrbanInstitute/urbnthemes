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

    if (n > 8) {

      stop(
        paste(
          "Error: urbnthemes allows for a max of 8 colors. Your code asked for",
          n,
          "colors.",
          "If you need more than 8 colors for exploratory purposes, use",
          "ggplot2::scale_fill_discrete() or ggplot2::scale_color_discrete()."
        )
      )

    }

    types[[n]]
  }
}

#' Discrete color scale that aligns with the Urban Institute style
#'
#' This function can only handle up to 8 categories/colors.
#'
#' If you need more than 8 colors for exploratory purposes, use
#' ggplot2::scale_fill_discrete().
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_color_discrete <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = "urbn",
    palette = urbn_color_pal("categorical"),
    ...
  )
}

#' Discrete color scale that aligns with the Urban Institute style
#'
#' This function can only handle up to 8 categories/colors.
#'
#' If you need more than 8 colors for exploratory purposes, use
#' ggplot2::scale_color_discrete().
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_colour_discrete <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = "urbn",
    palette = urbn_color_pal("categorical"),
    ...
  )
}

#' Discrete fill scale that aligns with the Urban Institute style
#'
#' This function can only handle up to 8 categories/colors.
#'
#' If you need more than 8 colors for exploratory purposes, use
#' ggplot2::scale_fill_discrete().
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_fill_discrete <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = "urbn",
    palette = urbn_color_pal("categorical"),
    ...
  )
}

#' Continuous fill scale that aligns with the Urban Institute style
#'
#' @md
#' @param colours vector of colours
#' @param colors vector of colours
#' @param values if colours should not be evenly positioned along the gradient this vector gives the position (between 0 and 1) for each colour in the colours vector. See rescale for a convience function to map an arbitrary range to between 0 and 1
#' @param space colour space in which to calculate gradient. Must be "Lab" - other values are deprecated.
#' @param na.value default color for NA values
#' @param guide legend representation of scale
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_color_gradientn <- function(...,
                                  colours = c("#CFE8F3","#A2D4EC","#73BFE2","#46ABDB", "#1696D2","#12719E","#0A4C6A","#062635"),
                                  colors = c("#CFE8F3","#A2D4EC","#73BFE2","#46ABDB", "#1696D2","#12719E","#0A4C6A","#062635"),
                                  values = NULL,
                                  space = "Lab",
                                  na.value = "grey50",
                                  guide = "colourbar") {

  colours <- if (missing(colours)) colors else colours

  ggplot2::continuous_scale(
    aesthetics = "colour",
    scale_name = "gradientn",
    palette = scales::gradient_n_pal(colours, values, space),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' Continuous fill scale that aligns with the Urban Institute style
#'
#' @md
#' @param colours vector of colours
#' @param colors vector of colours
#' @param values if colours should not be evenly positioned along the gradient this vector gives the position (between 0 and 1) for each colour in the colours vector. See rescale for a convience function to map an arbitrary range to between 0 and 1
#' @param space colour space in which to calculate gradient. Must be "Lab" - other values are deprecated.
#' @param na.value default color for NA values
#' @param guide legend representation of scale
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_colour_gradientn <- scale_color_gradientn

#' Continuous fill scale that aligns with the Urban Institute style
#'
#' @md
#' @param colours vector of colours
#' @param colors vector of colours
#' @param values if colours should not be evenly positioned along the gradient this vector gives the position (between 0 and 1) for each colour in the colours vector. See rescale for a convience function to map an arbitrary range to between 0 and 1
#' @param space colour space in which to calculate gradient. Must be "Lab" - other values are deprecated.
#' @param na.value default color for NA values
#' @param guide legend representation of scale
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_fill_gradientn <- function(...,
                                 colours = c("#CFE8F3","#A2D4EC","#73BFE2","#46ABDB", "#1696D2","#12719E","#0A4C6A","#062635"),
                                 colors = c("#CFE8F3","#A2D4EC","#73BFE2","#46ABDB", "#1696D2","#12719E","#0A4C6A","#062635"),
                                 values = NULL,
                                 space = "Lab",
                                 na.value = "grey50",
                                 guide = "colourbar") {

  colours <- if (missing(colours)) colors else colours

  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "gradientn",
    palette = scales::gradient_n_pal(colours, values, space),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' Discrete fill scale for ordinal factors that aligns with the Urban Institute style
#'
#' This function can only handle up to 8 categories/colors.
#'
#' If you need more than 8 colors for exploratory purposes, use
#' ggplot2::scale_fill_ordinal().
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_fill_ordinal <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "color",
    scale_name = "urbn",
    palette = urbn_color_pal("sequential"),
    ...
  )
}

#' Discrete color scale for ordinal factors that aligns with the Urban Institute style
#'
#' This function can only handle up to 8 categories/colors.
#'
#' If you need more than 8 colors for exploratory purposes, use
#' ggplot2::scale_color_ordinal().
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_color_ordinal <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "color",
    scale_name = "urbn",
    palette = urbn_color_pal("sequential"),
    ...
  )
}

#' Discrete color scale for ordinal factors that aligns with the Urban Institute style
#'
#' This function can only handle up to 8 categories/colors.
#'
#' If you need more than 8 colors for exploratory purposes, use
#' ggplot2::scale_colour_ordinal().
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_colour_ordinal <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "color",
    scale_name = "urbn",
    palette = urbn_color_pal("sequential"),
    ...
  )
}


