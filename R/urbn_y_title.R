#' urbn_y_title
#'
#' @param string character string for a y-axis title
#' @param size font size for the y-axis title
#'
#' @return a grob formatted for a y-axis title in a ggplot
#' @export
#'
urbn_y_title <- function(string, size = 8.5) {
  grid::textGrob(string,
                 x = unit(0, "npc"),
                 y = unit(1, "npc"),
                 hjust = 0,
                 vjust = 1,
                 gp = gpar(fontsize = size,
                           fontfamily = "Lato",
                           fontface = "italic"))
}
