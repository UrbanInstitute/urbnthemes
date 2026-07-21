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

      warning(
        paste(
          "urbnthemes is designed for a max of 8 colors. Your code asked for",
          n,
          "colors. Colors will be interpolated from the 8-color palette,",
          "which may not meet the Urban Institute style guidelines."
        ),
        call. = FALSE
      )

      # Interpolate colors using colorRampPalette
      colors <- grDevices::colorRampPalette(types[[8]])(n)
      return(colors)

    }

    types[[n]]
  }
}

#' Get Urban Institute palette by name
#'
#' Internal helper function to retrieve palette vectors by name.
#' Supports both categorical palettes (for discrete scales) and
#' sequential palettes (for continuous/ordinal scales).
#'
#' @param palette_name Name of the palette. Options:
#'   - Categorical: "main" (default for discrete scales)
#'   - Sequential: "cyan" (default for gradient scales), "gray", "yellow",
#'     "magenta", "green", "spacegray", "red"
#'   - Other: "diverging", "politics", "quintile"
#' @return A vector of hex color codes
#' @keywords internal
get_urbn_palette <- function(palette_name = "main") {

  palettes <- list(
    "main" = palette_urbn_main,
    "cyan" = palette_urbn_cyan,
    "gray" = palette_urbn_gray,
    "grey" = palette_urbn_gray,
    "yellow" = palette_urbn_yellow,
    "magenta" = palette_urbn_magenta,
    "green" = palette_urbn_green,
    "spacegray" = palette_urbn_spacegray,
    "red" = palette_urbn_red,
    "diverging" = palette_urbn_diverging,
    "politics" = palette_urbn_politics,
    "quintile" = palette_urbn_quintile
  )

  if (!palette_name %in% names(palettes)) {
    stop(
      "Unknown palette name: '", palette_name, "'. ",
      "Available palettes: ", paste(names(palettes), collapse = ", "),
      call. = FALSE
    )
  }

  palettes[[palette_name]]
}

#' Discrete color scale that aligns with the Urban Institute style
#'
#' This function is designed for up to 8 categories/colors. If more than 8
#' colors are requested, a warning will be issued and colors will be
#' interpolated, which may not meet Urban Institute style guidelines.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "main" (default), "cyan", "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging", "politics", "quintile"
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_color_discrete <- function(palette = "main", ...) {

  # Get the palette colors
  pal_colors <- unname(get_urbn_palette(palette))

  # Create a palette function that returns the right number of colors
  pal_func <- function(n) {
    if (n > length(pal_colors)) {
      warning(
        paste(
          "urbnthemes is designed for a max of", length(pal_colors), "colors.",
          "Your code asked for", n, "colors.",
          "Colors will be interpolated from the", length(pal_colors), "-color palette,",
          "which may not meet the Urban Institute style guidelines."
        ),
        call. = FALSE
      )
      return(grDevices::colorRampPalette(pal_colors)(n))
    }
    pal_colors[1:n]
  }

  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = "urbn",
    palette = pal_func,
    ...
  )
}

#' Discrete color scale that aligns with the Urban Institute style
#'
#' This function is designed for up to 8 categories/colors. If more than 8
#' colors are requested, a warning will be issued and colors will be
#' interpolated, which may not meet Urban Institute style guidelines.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "main" (default), "cyan", "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging", "politics", "quintile"
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_colour_discrete <- function(palette = "main", ...) {
  scale_color_discrete(palette = palette, ...)
}

#' Discrete fill scale that aligns with the Urban Institute style
#'
#' This function is designed for up to 8 categories/colors. If more than 8
#' colors are requested, a warning will be issued and colors will be
#' interpolated, which may not meet Urban Institute style guidelines.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "main" (default), "cyan", "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging", "politics", "quintile"
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_fill_discrete <- function(palette = "main", ...) {

  # Get the palette colors
  pal_colors <- unname(get_urbn_palette(palette))

  # Create a palette function that returns the right number of colors
  pal_func <- function(n) {
    if (n > length(pal_colors)) {
      warning(
        paste(
          "urbnthemes is designed for a max of", length(pal_colors), "colors.",
          "Your code asked for", n, "colors.",
          "Colors will be interpolated from the", length(pal_colors), "-color palette,",
          "which may not meet the Urban Institute style guidelines."
        ),
        call. = FALSE
      )
      return(grDevices::colorRampPalette(pal_colors)(n))
    }
    pal_colors[1:n]
  }

  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = "urbn",
    palette = pal_func,
    ...
  )
}

#' Continuous fill scale that aligns with the Urban Institute style
#'
#' @md
#' @param palette Name of the Urban Institute palette to use for the gradient.
#'   Options: "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging". Ignored if \code{colours} or \code{colors}
#'   is specified.
#' @param colours vector of colours
#' @param colors vector of colours
#' @param values if colours should not be evenly positioned along the gradient this vector gives the position (between 0 and 1) for each colour in the colours vector. See rescale for a convience function to map an arbitrary range to between 0 and 1
#' @param space colour space in which to calculate gradient. Must be "Lab" - other values are deprecated.
#' @param na.value default color for NA values
#' @param guide legend representation of scale
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_color_gradientn <- function(palette = "cyan",
                                  ...,
                                  colours,
                                  colors,
                                  values = NULL,
                                  space = "Lab",
                                  na.value = "grey50",
                                  guide = "colourbar") {

  # Use palette if no explicit colors provided
  if (missing(colours) && missing(colors)) {
    colours <- get_urbn_palette(palette)
  } else {
    colours <- if (missing(colours)) colors else colours
  }

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
#' @param palette Name of the Urban Institute palette to use for the gradient.
#'   Options: "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging". Ignored if \code{colours} or \code{colors}
#'   is specified.
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
#' @param palette Name of the Urban Institute palette to use for the gradient.
#'   Options: "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging". Ignored if \code{colours} or \code{colors}
#'   is specified.
#' @param colours vector of colours
#' @param colors vector of colours
#' @param values if colours should not be evenly positioned along the gradient this vector gives the position (between 0 and 1) for each colour in the colours vector. See rescale for a convience function to map an arbitrary range to between 0 and 1
#' @param space colour space in which to calculate gradient. Must be "Lab" - other values are deprecated.
#' @param na.value default color for NA values
#' @param guide legend representation of scale
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_fill_gradientn <- function(palette = "cyan",
                                 ...,
                                 colours,
                                 colors,
                                 values = NULL,
                                 space = "Lab",
                                 na.value = "grey50",
                                 guide = "colourbar") {

  # Use palette if no explicit colors provided
  if (missing(colours) && missing(colors)) {
    colours <- get_urbn_palette(palette)
  } else {
    colours <- if (missing(colours)) colors else colours
  }

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
#' This function is designed for ordinal/sequential data with up to 8 categories.
#' Uses sequential palettes (light to dark) by default.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging"
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_fill_ordinal <- function(palette = "cyan", ...) {

  # Get the palette colors
  pal_colors <- unname(get_urbn_palette(palette))

  # Create a palette function
  pal_func <- function(n) {
    if (n > length(pal_colors)) {
      warning(
        paste(
          "urbnthemes is designed for a max of", length(pal_colors), "colors.",
          "Your code asked for", n, "colors.",
          "Colors will be interpolated."
        ),
        call. = FALSE
      )
      return(grDevices::colorRampPalette(pal_colors)(n))
    }
    pal_colors[1:n]
  }

  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = "urbn",
    palette = pal_func,
    ...
  )
}

#' Discrete color scale for ordinal factors that aligns with the Urban Institute style
#'
#' This function is designed for ordinal/sequential data with up to 8 categories.
#' Uses sequential palettes (light to dark) by default.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging"
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_color_ordinal <- function(palette = "cyan", ...) {

  # Get the palette colors
  pal_colors <- unname(get_urbn_palette(palette))

  # Create a palette function
  pal_func <- function(n) {
    if (n > length(pal_colors)) {
      warning(
        paste(
          "urbnthemes is designed for a max of", length(pal_colors), "colors.",
          "Your code asked for", n, "colors.",
          "Colors will be interpolated."
        ),
        call. = FALSE
      )
      return(grDevices::colorRampPalette(pal_colors)(n))
    }
    pal_colors[1:n]
  }

  ggplot2::discrete_scale(
    aesthetics = "color",
    scale_name = "urbn",
    palette = pal_func,
    ...
  )
}

#' Discrete color scale for ordinal factors that aligns with the Urban Institute style
#'
#' This function is designed for ordinal/sequential data with up to 8 categories.
#' Uses sequential palettes (light to dark) by default.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "diverging"
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_colour_ordinal <- function(palette = "cyan", ...) {
  scale_color_ordinal(palette = palette, ...)
}

#' Two-color gradient fill scale that aligns with the Urban Institute style
#'
#' Creates a smooth gradient between two colors. By default uses the lightest
#' and darkest colors from the selected palette.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red"
#' @param low Color for low end of gradient. If not specified, uses
#'   first color from palette.
#' @param high Color for high end of gradient. If not specified, uses
#'   last color from palette.
#' @param space colour space in which to calculate gradient.
#'   Must be "Lab" (default) - other values are deprecated.
#' @param na.value Color to use for missing values
#' @param guide Type of legend. defaults to "colourbar"
#' @param ... other arguments passed to \code{continuous_scale()}
#' @export
scale_fill_gradient <- function(palette = "cyan",
                                low,
                                high,
                                space = "Lab",
                                na.value = "grey50",
                                guide = "colourbar",
                                ...) {

  # Get palette colors if low/high not specified
  if (missing(low) || missing(high)) {
    pal_colors <- get_urbn_palette(palette)
    if (missing(low)) low <- pal_colors[1]
    if (missing(high)) high <- pal_colors[length(pal_colors)]
  }

  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "gradient",
    palette = scales::gradient_n_pal(c(low, high), NULL, space),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' Two-color gradient color scale that aligns with the Urban Institute style
#'
#' Creates a smooth gradient between two colors. By default uses the lightest
#' and darkest colors from the selected palette.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red"
#' @param low Color for low end of gradient. If not specified, uses
#'   first color from palette.
#' @param high Color for high end of gradient. If not specified, uses
#'   last color from palette.
#' @param space colour space in which to calculate gradient.
#'   Must be "Lab" (default) - other values are deprecated.
#' @param na.value Color to use for missing values
#' @param guide Type of legend. defaults to "colourbar"
#' @param ... other arguments passed to \code{continuous_scale()}
#' @export
scale_color_gradient <- function(palette = "cyan",
                                 low,
                                 high,
                                 space = "Lab",
                                 na.value = "grey50",
                                 guide = "colourbar",
                                 ...) {

  # Get palette colors if low/high not specified
  if (missing(low) || missing(high)) {
    pal_colors <- get_urbn_palette(palette)
    if (missing(low)) low <- pal_colors[1]
    if (missing(high)) high <- pal_colors[length(pal_colors)]
  }

  ggplot2::continuous_scale(
    aesthetics = "colour",
    scale_name = "gradient",
    palette = scales::gradient_n_pal(c(low, high), NULL, space),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' Two-color gradient color scale that aligns with the Urban Institute style
#'
#' @rdname scale_color_gradient
#' @export
scale_colour_gradient <- scale_color_gradient

#' Diverging fill scale that aligns with the Urban Institute style
#'
#' Creates a diverging gradient with a midpoint. By default uses the
#' cyan palette with a white midpoint. Useful for data with a natural
#' midpoint (e.g., positive/negative values, above/below average).
#' Use palette = "diverging" for the orange-to-cyan diverging palette.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green", "spacegray",
#'   "red", or "diverging" for the orange-to-cyan palette.
#' @param low Color for low end of gradient
#' @param mid Color for midpoint
#' @param high Color for high end of gradient
#' @param midpoint The midpoint (in data value) of the diverging scale.
#'   Defaults to 0.
#' @param space colour space in which to calculate gradient.
#'   Must be "Lab" (default) - other values are deprecated.
#' @param na.value Color to use for missing values
#' @param guide Type of legend. defaults to "colourbar"
#' @param ... other arguments passed to \code{continuous_scale()}
#' @export
scale_fill_gradient2 <- function(palette = "diverging",
                                 low,
                                 mid,
                                 high,
                                 midpoint = 0,
                                 space = "Lab",
                                 na.value = "grey50",
                                 guide = "colourbar",
                                 ...) {

  # Get palette colors if not specified
  if (missing(low) || missing(mid) || missing(high)) {
    pal_colors <- get_urbn_palette(palette)

    if (palette == "diverging") {
      # Diverging palette: use start, middle, and end
      if (missing(low)) low <- pal_colors[2]
      if (missing(mid)) mid <- pal_colors[4]  # Middle of 8-color palette
      if (missing(high)) high <- pal_colors[length(pal_colors) - 1]
    } else {
      # Sequential palette: use light, mid-tone, and dark
      if (missing(low)) low <- pal_colors[2]
      if (missing(mid)) mid <- "#ffffff"  # White midpoint
      if (missing(high)) high <- pal_colors[length(pal_colors) - 1]
    }
  }

  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "gradient2",
    palette = scales::div_gradient_pal(low, mid, high, space),
    na.value = na.value,
    guide = guide,
    rescaler = function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) {
      scales::rescale_mid(x, to, from, midpoint)
    },
    ...
  )
}

#' Diverging color scale that aligns with the Urban Institute style
#'
#' Creates a diverging gradient with a midpoint. By default uses the
#' cyan palette with a white midpoint. Useful for data with a natural
#' midpoint (e.g., positive/negative values, above/below average).
#' Use palette = "diverging" for the orange-to-cyan diverging palette.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green", "spacegray",
#'   "red", or "diverging" for the orange-to-cyan palette.
#' @param low Color for low end of gradient
#' @param mid Color for midpoint
#' @param high Color for high end of gradient
#' @param midpoint The midpoint (in data value) of the diverging scale.
#'   Defaults to 0.
#' @param space colour space in which to calculate gradient.
#'   Must be "Lab" (default) - other values are deprecated.
#' @param na.value Color to use for missing values
#' @param guide Type of legend. defaults to "colourbar"
#' @param ... other arguments passed to \code{continuous_scale()}
#' @export
scale_color_gradient2 <- function(palette = "diverging",
                                  low,
                                  mid,
                                  high,
                                  midpoint = 0,
                                  space = "Lab",
                                  na.value = "grey50",
                                  guide = "colourbar",
                                  ...) {

  # Get palette colors if not specified
  if (missing(low) || missing(mid) || missing(high)) {
    pal_colors <- get_urbn_palette(palette)

    if (palette == "diverging") {
      # Diverging palette: use start, middle, and end
      if (missing(low)) low <- pal_colors[2]
      if (missing(mid)) mid <- pal_colors[4]  # Middle of 8-color palette
      if (missing(high)) high <- pal_colors[length(pal_colors) - 1]
    } else {
      # Sequential palette: use light, mid-tone, and dark
      if (missing(low)) low <- pal_colors[2]
      if (missing(mid)) mid <- "#ffffff"  # White midpoint
      if (missing(high)) high <- pal_colors[length(pal_colors) - 1]
    }
  }

  ggplot2::continuous_scale(
    aesthetics = "colour",
    scale_name = "gradient2",
    palette = scales::div_gradient_pal(low, mid, high, space),
    na.value = na.value,
    guide = guide,
    rescaler = function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) {
      scales::rescale_mid(x, to, from, midpoint)
    },
    ...
  )
}

#' Diverging color scale that aligns with the Urban Institute style
#'
#' @rdname scale_color_gradient2
#' @export
scale_colour_gradient2 <- scale_color_gradient2

#' Binned fill scale that aligns with the Urban Institute style
#'
#' Creates discrete color bins for continuous data. Useful for creating
#' choropleth maps or binned heatmaps that follow Urban Institute style.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "main"
#' @param n.breaks Approximate number of breaks/bins to create. If NULL, uses
#'   ggplot2's default binning (5 breaks). When \code{nice.breaks = TRUE}
#'   (the default), breaks are rounded to nice values, so the realized bin
#'   count may not exactly equal \code{n.breaks + 1}.
#' @param nice.breaks Should breaks be rounded to nice values? Default TRUE.
#' @param na.value Color to use for missing values
#' @param guide Type of legend. defaults to "coloursteps"
#' @param ... other arguments passed to \code{binned_scale()}
#' @export
scale_fill_binned <- function(palette = "cyan",
                              n.breaks = NULL,
                              nice.breaks = TRUE,
                              na.value = "grey50",
                              guide = "coloursteps",
                              ...) {

  # Get palette colors
  pal_colors <- unname(get_urbn_palette(palette))

  # Create a palette function that returns n colors
  pal_func <- function(n) {
    if (n <= length(pal_colors)) {
      pal_colors[1:n]
    } else {
      grDevices::colorRampPalette(pal_colors)(n)
    }
  }

  # Wrap for binned scale (binned_scale passes a vector, we need length)
  binned_pal_func <- function(x) {
    pal_func(length(x))
  }

  # Pass n.breaks through to binned_scale() directly rather than baking it
  # into a breaks_pretty() closure -- ScaleBinned$get_breaks() only reads
  # n.breaks from the scale object itself, and re-calls any custom breaks
  # function with its own default n (5), silently ignoring a baked-in n.
  ggplot2::binned_scale(
    aesthetics = "fill",
    scale_name = "urbn_binned",
    palette = binned_pal_func,
    n.breaks = n.breaks,
    nice.breaks = nice.breaks,
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' Binned color scale that aligns with the Urban Institute style
#'
#' Creates discrete color bins for continuous data. Useful for creating
#' choropleth maps or binned heatmaps that follow Urban Institute style.
#'
#' @md
#' @param palette Name of the Urban Institute palette to use. Options:
#'   "cyan" (default), "gray", "yellow", "magenta", "green",
#'   "spacegray", "red", "main"
#' @param n.breaks Approximate number of breaks/bins to create. If NULL, uses
#'   ggplot2's default binning (5 breaks). When \code{nice.breaks = TRUE}
#'   (the default), breaks are rounded to nice values, so the realized bin
#'   count may not exactly equal \code{n.breaks + 1}.
#' @param nice.breaks Should breaks be rounded to nice values? Default TRUE.
#' @param na.value Color to use for missing values
#' @param guide Type of legend. defaults to "coloursteps"
#' @param ... other arguments passed to \code{binned_scale()}
#' @export
scale_color_binned <- function(palette = "cyan",
                               n.breaks = NULL,
                               nice.breaks = TRUE,
                               na.value = "grey50",
                               guide = "coloursteps",
                               ...) {

  # Get palette colors
  pal_colors <- unname(get_urbn_palette(palette))

  # Create a palette function that returns n colors
  pal_func <- function(n) {
    if (n <= length(pal_colors)) {
      pal_colors[1:n]
    } else {
      grDevices::colorRampPalette(pal_colors)(n)
    }
  }

  # Wrap for binned scale (binned_scale passes a vector, we need length)
  binned_pal_func <- function(x) {
    pal_func(length(x))
  }

  # Pass n.breaks through to binned_scale() directly rather than baking it
  # into a breaks_pretty() closure -- ScaleBinned$get_breaks() only reads
  # n.breaks from the scale object itself, and re-calls any custom breaks
  # function with its own default n (5), silently ignoring a baked-in n.
  ggplot2::binned_scale(
    aesthetics = "colour",
    scale_name = "urbn_binned",
    palette = binned_pal_func,
    n.breaks = n.breaks,
    nice.breaks = nice.breaks,
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' Binned color scale that aligns with the Urban Institute style
#'
#' @rdname scale_color_binned
#' @export
scale_colour_binned <- scale_color_binned


