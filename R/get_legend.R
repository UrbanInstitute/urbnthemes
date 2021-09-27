#' get_legend
#'
#' Extract just the legend from a ggplot2 object.
#'
#' @param ggplot_object a ggplot
#'
#' @return a ggplot legend
#'
#' @export
#'
get_legend <- function(ggplot_object) {

  # if NULL then return NULL
  if (is.null(ggplot_object)) return(NULL)

  # remove margin around legend
  temp <- ggplot_object +
    ggplot2::theme(legend.margin = ggplot2::margin(t = 0L, r = 0L, b = 0L, l = 0L, "pt"))

  # extract the legend
  temp <- ggplot2::ggplot_gtable(ggplot2::ggplot_build(temp))
  legend <- which(purrr::map_chr(temp$grobs, "name") == "guide-box")
  legend <- temp$grobs[[legend]]

  legend

}
