#' urbn_plot
#'
#' Combine elements from \code{urbn_title}, \code{urbn_subtitle},
#' \code{urbn_y_title}, \code{get_legend}, \code{remove_legend},
#' \code{urbn_notes}, \code{urbn_source}, and \code{ggplot2} into
#' one formatted plot.
#'
#' @details
#' This function requires the \code{patchwork} package.
#'
#' @param ... urbn plot objects or grobs
#' @param ncol number of columns to arrange objects into
#' @param heights relative heights of each object in the final plot
#'
#' @return one plot made from many grobs
#'
#' @export
#'
urbn_plot <- function(..., ncol = 1, heights = 1) {

  if (!requireNamespace("patchwork", quietly = TRUE)) {
    stop("Package 'patchwork' is required for urbn_plot(). Install with: install.packages('patchwork')")
  }

  objects <- list(...)

  # grobs need to be wrapped so patchwork can lay them out alongside ggplots
  wrapped <- lapply(objects, function(x) {
    if (inherits(x, c("ggplot", "patchwork"))) {
      x
    } else {
      patchwork::wrap_elements(full = x)
    }
  })

  patchwork::wrap_plots(wrapped, ncol = ncol) +
    patchwork::plot_layout(heights = heights)

}

