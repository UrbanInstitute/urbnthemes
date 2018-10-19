#' The Urban Institute [ggplot2] theme
#'
#' Removes axes and axes labels
#'
#' @param axis Axis to drop. "x", "y", or "both"
#'
#' @md
#' @export
remove_axis <- function(axis = "y") {

  if (axis == "x") {

    ggplot2::theme(panel.grid.major.x = ggplot2::element_blank(),
                   axis.text.x = ggplot2::element_blank(),
                   axis.line.x = ggplot2::element_blank())

  } else if (axis == "y") {

    ggplot2::theme(panel.grid.major.y = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_blank(),
                   axis.line.y = ggplot2::element_blank())

  } else if (axis == "both") {

    ggplot2::theme(panel.grid.major.x = ggplot2::element_blank(),
                   axis.text.x = ggplot2::element_blank(),
                   axis.line.x = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_blank(),
                   axis.line.y = ggplot2::element_blank())

  } else {

    stop('Invalid "axis" argument. Valid arguments are: ',
              '"x", "y", and "both"',
              call. = FALSE)
  }
}
