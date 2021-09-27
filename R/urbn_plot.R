#' urbn_plot
#'
#' Combine elements from \code{urbn_title}, \code{urbn_subtitle},
#' \code{urbn_y_title}, \code{get_legend}, \code{remove_legend},
#' \code{urbn_notes}, \code{urbn_source}, and \code{ggplot2} into
#' one formatted plot.
#'
#' @param ... urbn plot objects or grobs
#' @param heights relative heights of each object in the final plot
#'
#' @return one plot made from many grobs
#'
#' @export
#'
urbn_plot <- function(..., heights = 1) {
  grid.arrange(...,
               heights = heights)
}
