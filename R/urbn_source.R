#' urbn_source
#'
#' @param text character string for a source
#' @param size font size for the source
#' @param width a number of characters to allow before a character return
#' @param plural If `TRUE`, will change "Source:" to "Sources:"
#'
#' @return a grob formatted for a source in a ggplot
#' @export
#'
urbn_source <- function(text, size = 8, width = 132, plural = FALSE) {

  # should "Source:" be "Sources:" in the note
  if (!plural) {

    section_title <- "Source: "

  } else {

    section_title <- "Sources: "

  }

  # get the shorter first line
  wrapped_lines <- stringr::str_wrap(text, width = width - 6)

  line1 <- paste0(stringr::str_split(wrapped_lines, "\n", n = 2)[[1]][1], "\n")

  multiline <- length(stringr::str_split(wrapped_lines, "\n", n = 2)[[1]]) > 1

  if (multiline) {

    lines <- stringr::str_replace_all(stringr::str_split(wrapped_lines, "\n", n = 2)[[1]][2], "\n", " ")

    lines <- stringr::str_wrap(lines, width = width)

  }

  grob1 <- grid::textGrob(
    section_title,
    name = "source1",
    x = unit(0, "npc"),
    y = unit(1, "npc"),
    hjust = 0,
    vjust = 1,
    gp = gpar(fontsize = size, fontfamily = "Lato", fontface = "bold")
  )

  grob2 <- grid::textGrob(
    line1,
    x = unit(0, "npc") + grobWidth("source1"),
    y = unit(1, "npc"),
    hjust = 0,
    vjust = 1,
    gp = gpar(fontsize = size, fontfamily = "Lato")
  )

  if (multiline) {

    grob3 <- textGrob(
      lines,
      x = unit(0, "npc"),
      y = unit(1, "npc") - 1.5 * grobHeight("source1"),
      hjust = 0,
      vjust = 1,
      gp = gpar(fontsize = size, fontfamily = "Lato", lineheight = 1)
    )


    grobTree(grob1, grob2, grob3)

  } else {

    grobTree(grob1, grob2)

  }
}
