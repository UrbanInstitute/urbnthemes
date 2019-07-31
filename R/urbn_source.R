#' urbn_source
#'
#' @param string character string for a source statement
#' @param size font size for the source
#'
#' @return a grob formatted for a source in a ggplot
#' @export
#'
urbn_source <- function(string, size = 8) {
  grid::grobTree(
    grid::textGrob("Source: ",
             name = "source1",
             x = unit(0, "npc"),
             y = unit(1, "npc"),
             hjust = 0,
             vjust = 1,
             gp = gpar(fontsize = 8, fontfamily = "Lato", fontface = "bold")),
    grid::textGrob(string,
             x = unit(0, "npc") + grobWidth("source1"),
             y = unit(1, "npc"),
             hjust = 0,
             vjust = 1,
             gp = gpar(fontsize = 8, fontfamily = "Lato"))
  )
}
