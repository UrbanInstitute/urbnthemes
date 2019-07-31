#' The Urban Institute [ggplot2] theme
#'
#' Creates a grid object with the Urban Institute logo
#'
#' @import grid
#' @import gridExtra
#' @md
#' @export
urbn_logo_text <- function() {
  grid::grobTree(
  gp = gpar(fontsize = 7, hjust = 1),
  textGrob(label = " I N S T I T U T E",
           name = "caption1",
           x = unit(1, "npc"),
           y = unit(0, "npc"),
           hjust = 1,
           vjust = 0,
           gp = gpar(fontface = "bold", fontfamily = "Lato")),
  grid::textGrob(label = "U R B A N ",
           x = unit(1, "npc") - grobWidth("caption1") - unit(0.001, "lines"),
           y = unit(0, "npc"),
           hjust = 1,
           vjust = 0,
           gp = gpar(col = "#1696d2", fontface = "bold", fontfamily = "Lato"))
  )
}
