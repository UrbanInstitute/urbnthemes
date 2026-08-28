#' Add Urban Institute logo to a ggplot
#'
#' Adds the Urban Institute logo below a ggplot object using patchwork.
#' The logo should be placed in \code{inst/urbn-logo.png} within the package.
#'
#' @param plot A ggplot2 object
#' @param logo_path Path to logo PNG file. Defaults to the package logo.
#' @param position Horizontal position of logo: "right" (default) or "left"
#' @param logo_height Height of logo row relative to plot. Default is 0.08 (8% of plot height).
#'
#' @details
#' This function requires the \code{png} and \code{patchwork} packages.
#'
#' The logo is added as a separate row below the plot, so it does not overlap
#' with the visualization.
#'
#' @return A patchwork/ggplot2 object with the logo added
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(urbnthemes)
#'
#' p <- ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() +
#'   theme_urbn_print()
#'
#' add_urbn_logo(p)
#' }
#'
#' @export
add_urbn_logo <- function(plot,
                          logo_path = system.file("urbn-logo.png", package = "urbnthemes"),
                          position = "right",
                          logo_height = 0.08) {

  # check if required packages are available

  if (!requireNamespace("png", quietly = TRUE)) {
    warning("Package 'png' is required for add_urbn_logo(). Install with: install.packages('png')")
    return(plot)
  }

  if (!requireNamespace("patchwork", quietly = TRUE)) {
    warning("Package 'patchwork' is required for add_urbn_logo(). Install with: install.packages('patchwork')")
    return(plot)
  }

  # check if logo file exists
  if (!file.exists(logo_path) || logo_path == "") {
    warning("Logo file not found at: ", logo_path, "\nReturning plot without logo.")
    return(plot)
  }

  # read the logo and convert to grob

  logo <- png::readPNG(logo_path)
  logo_grob <- grid::rasterGrob(logo, interpolate = TRUE)

  # create a blank ggplot to hold the logo

  hjust <- if (position == "left") 0 else 1

  logo_plot <- ggplot2::ggplot() +
    ggplot2::annotation_custom(logo_grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf) +
    ggplot2::coord_cartesian(clip = "off") +
    ggplot2::scale_x_continuous(expand = c(0, 0)) +
    ggplot2::scale_y_continuous(expand = c(0, 0)) +
    ggplot2::theme_void()

  # create spacer for positioning
  spacer <- patchwork::plot_spacer()

  # compose with patchwork: plot on top, logo row below

  if (position == "left") {
    logo_row <- logo_plot + spacer + patchwork::plot_layout(widths = c(0.25, 0.75))
  } else {
    logo_row <- spacer + logo_plot + patchwork::plot_layout(widths = c(0.75, 0.25))
  }

  # stack plot and logo row
  plot / logo_row + patchwork::plot_layout(heights = c(1 - logo_height, logo_height))

}

