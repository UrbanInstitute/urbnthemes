#' The Urban Institute [ggplot2] theme
#'
#' Adds tick axes and axes labels
#'
#' @param axis Axis to drop. "x", "y", or "both"
#'
#' @md
#' @export
remove_axis <- function(axis = "y") {

  if (axis == "x") {

    ggplot2::theme(axis.line.x = ggplot2::element_line(colour = NULL,
                                                       size = NULL,
                                                       linetype = NULL,
                                                       lineend = NULL),
                   axis.line.y = ggplot2::element_blank())

  } else if (axis == "y") {

    ggplot2::theme(axis.line.x = ggplot2::element_blank(),
                   axis.line.y = ggplot2::element_line(colour = NULL,
                                                       size = NULL,
                                                       linetype = NULL,
                                                       lineend = NULL)
                   )

  } else if (axis == "both") {

    ggplot2::theme(axis.line.x = ggplot2::element_line(colour = NULL,
                                                       size = NULL,
                                                       linetype = NULL,
                                                       lineend = NULL),
                   axis.line.y = ggplot2::element_line(colour = NULL,
                                                       size = NULL,
                                                       linetype = NULL,
                                                       lineend = NULL)
                   )

  } else {

    stop('Invalid "axis" argument. Valid arguments are: ',
              '"x", "y", and "both"',
              call. = FALSE)
  }
}
