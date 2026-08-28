#' Set Urban Institute defaults for knitr/Quarto documents
#'
#' \code{urbn_set_knitr_defaults()} configures knitr chunk options for optimal
#' plot rendering with urbnthemes in RMarkdown and Quarto documents. It sets
#' the ragg graphics device for better font rendering and applies urbnthemes defaults.
#'
#' @param fig_width Default figure width in inches
#' @param fig_height Default figure height in inches
#' @param dpi Resolution in dots per inch
#' @param dev Graphics device to use (default is "ragg_png" for best font rendering)
#' @param style The default theme style. "print" or "map"
#' @param base_size The base font size for the theme
#' @param base_family The base font family for the theme
#' @param base_line_size The base line size for the theme
#' @param base_rect_size The base rect size for the theme
#' @param scale For `theme_urbn_map()`. Should the legend theme be continuous or discrete?
#'
#' @details
#' This function is designed to be called in a setup chunk at the beginning of
#' your RMarkdown or Quarto document. It combines knitr configuration with
#' \code{set_urbn_defaults()} for a complete setup.
#'
#' The ragg graphics device provides better font rendering and cross-platform
#' consistency. Make sure the ragg package is installed: \code{install.packages("ragg")}
#'
#' @examples
#' \dontrun{
#' # In a setup chunk:
#' library(urbnthemes)
#' urbn_set_knitr_defaults()
#'
#' # Custom figure dimensions:
#' urbn_set_knitr_defaults(fig_width = 8, fig_height = 5)
#'
#' # For maps:
#' urbn_set_knitr_defaults(style = "map")
#' }
#'
#' @seealso \code{\link{set_urbn_defaults}}
#' @md
#' @export
urbn_set_knitr_defaults <- function(fig_width = 6.5,
                                    fig_height = 4,
                                    dpi = 300,
                                    dev = "ragg_png",
                                    style = "print",
                                    base_size = 8.5,
                                    base_family = "Lato",
                                    base_line_size = 0.5,
                                    base_rect_size = 0.5,
                                    scale = "continuous") {

  # check if knitr is available
  if (!requireNamespace("knitr", quietly = TRUE)) {
    stop("Package 'knitr' is required for this function. Install it with: install.packages('knitr')")
  }

  # warn if ragg is not available but dev = "ragg_png"
  if (dev == "ragg_png" && !requireNamespace("ragg", quietly = TRUE)) {
    warning("Package 'ragg' is not installed. Font rendering may not be optimal. Install it with: install.packages('ragg')")
  }

  # set knitr chunk options
  knitr::opts_chunk$set(
    fig.width = fig_width,
    fig.height = fig_height,
    dpi = dpi,
    dev = dev,
    fig.retina = 2
  )

  # apply urbnthemes defaults
  set_urbn_defaults(
    style = style,
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size,
    scale = scale
  )

  message("urbnthemes knitr defaults applied successfully!")
  message("Graphics device: ", dev)
  message("Figure dimensions: ", fig_width, " x ", fig_height, " inches")
  message("Theme style: ", style)

  invisible(TRUE)
}
