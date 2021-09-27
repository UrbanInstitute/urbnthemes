#' urbn_title
#'
#' Add a title to a plot created with \code{urbn_plot()}.
#'
#' @param string character string for a title
#' @param size font size for the title
#' @param width a number of characters to allow before a character return
#'
#' @return a grob formatted for a source in a ggplot
#'
#' @export
#'
urbn_title <- function(string, size = 12, width = 68) {

  if (width == FALSE) {
    grid::textGrob(string,
             x = unit(0, "npc"),
             y = unit(1, "npc"),
             hjust = 0,
             vjust = 1,
             gp = gpar(fontsize = size,
                       fontfamily = "Lato",
                       lineheight = 1,
                       fontface = "bold"))
  } else {
    grid::textGrob(stringr::str_wrap(string, width = width),
             x = unit(0, "npc"),
             y = unit(1, "npc"),
             hjust = 0,
             vjust = 1,
             gp = gpar(fontsize = size,
                       fontfamily = "Lato",
                       lineheight = 1,
                       fontface = "bold"))
  }
}
