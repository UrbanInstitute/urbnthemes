#' A [ggplot2] theme formatted in the Urban Institute style
#'
#' \code{theme_urban} provides a [ggplot2] theme formatted according to the
#' Urban Institute style guide for maps, with sensible defaults.
#'
#' @import extrafont
#' @import ggrepel
#' @md
#' @param base_family,base_size base font family and size
#' @param base_line_size,base_rect_size base line and rectangle sizes
#' @export

theme_urban_map <- function(base_size = 8.5, base_family = "Lato",
                              base_line_size = 0.5,
                              base_rect_size = 0.5) {

  theme_urban_print(base_size = 8.5, base_family = "Lato",
                  base_line_size = 0.5,
                  base_rect_size = 0.5) +
    ggplot2::theme(

      # make changes for mapping styles
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      axis.title = element_blank(),
      panel.grid = element_blank(),
      axis.line = element_blank(),

      # don't create a complete format
      complete = FALSE

    )

}
