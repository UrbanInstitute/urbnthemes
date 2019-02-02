#' The Urban Institute [ggplot2] theme
#'
#' Removes axes and axes labels
#'
#' @param axis Axis to drop. "x", "y", or "both"
#' @param flip TRUE/FALSE is `coord_flip()` is used
#'
#' @md
#' @export
remove_axis <- function(axis = "y", flip = FALSE) {

  if (axis == "x" && flip == FALSE) {

    ggplot2::theme(panel.grid.major.x = ggplot2::element_blank(),
                   axis.text.x = ggplot2::element_blank(),
                   axis.line.x = ggplot2::element_blank())

  } else if (axis == "x" && flip == TRUE) {

      ggplot2::theme(panel.grid.major.y = ggplot2::element_blank(),
                     axis.text.x = ggplot2::element_blank(),
                     axis.line.x = ggplot2::element_blank(),
                     axis.ticks = ggplot2::element_blank(),
                     axis.line.y = ggplot2::element_line(colour = NULL,
                                                         size = NULL,
                                                         linetype = NULL,
                                                         lineend = NULL))

  } else if (axis == "y" && flip == FALSE) {

    ggplot2::theme(panel.grid.major.y = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_blank(),
                   axis.line.y = ggplot2::element_blank(),
                   axis.ticks = ggplot2::element_blank())

  } else if (axis == "y" && flip == TRUE) {

    ggplot2::theme(panel.grid.major.y = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_blank(),
                   axis.line.y = ggplot2::element_blank(),
                   axis.ticks = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank())

  } else if (axis == "both") {

    ggplot2::theme(panel.grid.major.x = ggplot2::element_blank(),
                   axis.text.x = ggplot2::element_blank(),
                   axis.line.x = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_blank(),
                   axis.line.y = ggplot2::element_blank(),
                   axis.ticks = ggplot2::element_blank())

  } else {

    stop('Invalid "axis" or "flip" argument. Valid arguments are: ',
              '"x", "y", and "both", or TRUE/FALSE',
              call. = FALSE)
  }
}
