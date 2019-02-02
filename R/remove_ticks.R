#' The Urban Institute [ggplot2] theme
#'
#' Removes tick marks from all axes
#'
#' @param axis Axis to drop. "x", "y", or "both"
#'
#' @md
#' @export
remove_ticks <- function(axis = "both") {

  if (axis == "x") {

    ggplot2::theme(axis.ticks.x = ggplot2::element_blank())

  } else if (axis == "y") {

    ggplot2::theme(axis.ticks.y = ggplot2::element_blank())

  } else if (axis == "both") {

    ggplot2::theme(axis.ticks = ggplot2::element_blank(),
                   axis.ticks.x = ggplot2::element_blank(),
                   axis.ticks.y = ggplot2::element_blank())

  } else {

    stop('Invalid "axis" argument. Valid arguments are: ',
         '"x", "y", and "both"',
         call. = FALSE)

  }
}
