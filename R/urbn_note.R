#' urbn_note
#'
#' @param note character string for a note
#' @param size font size for the note
#' @param width a number of characters to allow before a character return
#'
#' @return a grob formatted for a source in a ggplot
#' @export
#'
urbn_note <- function(note, size = 8, width = 132) {

  # get the shorter first line
  wrapped_lines <- stringr::str_wrap(note, width = width - 6)

  line1 <- paste0(stringr::str_split(wrapped_lines, "\n", n = 2)[[1]][1], "\n")

  multiline <- length(stringr::str_split(wrapped_lines, "\n", n = 2)[[1]]) > 1

  if (multiline) {

    lines <- stringr::str_replace_all(stringr::str_split(wrapped_lines, "\n", n = 2)[[1]][2], "\n", " ")

    lines <- stringr::str_wrap(lines, width = width)

  }

  grob1 <- textGrob("Note: ",
                    name = "note1",
                    x = unit(0, "npc"),
                    y = unit(1, "npc"),
                    hjust = 0,
                    vjust = 1,
                    gp = gpar(fontsize = size, fontfamily = "Lato", fontface = "bold", lineheight = 1))

  grob2 <- textGrob(line1,
                    x = unit(0, "npc") + grobWidth("note1"),
                    y = unit(1, "npc"),
                    hjust = 0,
                    vjust = 1,
                    gp = gpar(fontsize = size, fontfamily = "Lato", lineheight = 1))


  if (multiline) {

    grob3 <- textGrob(lines,
                      x = unit(0, "npc"),
                      y = unit(1, "npc") - 1.5 * grobHeight("note1"),
                      hjust = 0,
                      vjust = 1,
                      gp = gpar(fontsize = size, fontfamily = "Lato", lineheight = 1))


    grobTree(grob1, grob2, grob3)
  } else {
    grobTree(grob1, grob2)
  }
}
