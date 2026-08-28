#' remove_legend
#'
#' Remove just the legend from a ggplot2 object.
#'
#' @param ggplot_object a ggplot
#'
#' @return a ggplot without a legend
#'
#' @export
#'
remove_legend <- function(ggplot_object) {

  ggplot_object +
    ggplot2::guides(
      color = "none",
      fill = "none",
      alpha = "none",
      size = "none",
      shape = "none",
      linetype = "none"
    )

}
