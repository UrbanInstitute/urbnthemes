#' Save ggplot2 plots in standard Urban Institute sizes
#'
#' This is a function to save standardized images for Urban Institute
#' publications. For more functionality like custom widths and heights, use
#' ggsave() directly.
#'
#' @param filename File name to create on disk.
#' @param plot Plot to save, defaults to last plot displayed.
#' @param size Size of plot. Must be one of "small" (3.25 x 2 inches),
#' "medium" (6.5 x 4 inches), or "large" (9 x 6.5 inches).
#' @param dpi Plot resolution. Also accepts a string input: "retina" (320),
#' "print" (300), or "screen" (72). Applies only to raster output types.
#'
#' @examples
#'
#' \dontrun{
#' library(tidyverse)
#' library(urbnthemes)
#'
#' set_urbn_defaults(style = "print")
#'
#' cars %>%
#'   ggplot(aes(speed, dist)) +
#'   geom_point()
#'
#' urbn_save("test.png")
#' }
#'
#' @export
urbn_save <- function(filename,
                      plot = ggplot2::last_plot(),
                      size = "medium",
                      dpi = 300) {

  stopifnot(is.character(filename))

  if (!size %in% c("small", "medium", "large")) {

    stop("Error: size must be one of 'small', 'medium', or 'large'")

  }

  sizes <- list(
    small = c(width = 3.25, height = 2),
    medium = c(width = 6.5, height = 4),
    large = c(width = 9, height = 6.5)
  )

  selected_size <- sizes[[size]]

  ggsave(
    filename = filename,
    plot = plot,
    width = selected_size["width"],
    height = selected_size["height"]
  )

}


