#' A [ggplot2] theme formatted in the Urban Institute style
#'
#' \code{theme_urban} provides a [ggplot2] theme formatted according to the
#' Urban Institute style guide for web, with sensible defaults.
#'
#' @import extrafont
#' @import ggrepel
#' @md
#' @param base_family,base_size base font family and size
#' @param base_line_size,base_rect_size base line and rectangle sizes
#' @export

theme_urban_print <- function(base_size = 8.5, base_family = "Lato",
                              base_line_size = 0.5,
                              base_rect_size = 0.5) {

  theme_urban_web(base_size = 8.5, base_family = "Lato",
                  base_line_size = 0.5,
                  base_rect_size = 0.5) +
    ggplot2::theme(

    # main attributes

    text = ggplot2::element_text(size = base_size),

    # Plot Attributes

    plot.title = ggplot2::element_text(size = base_size * 12 / 8.5),
    plot.subtitle = ggplot2::element_text(size = base_size * 9.5 / 8.5),
    plot.caption = ggplot2::element_text(size = base_size * 7 / 8.5),

    # axis attributes

    axis.text = ggplot2::element_text(size = base_size),

    axis.title = ggplot2::element_text(face = "italic",
                              size = base_size),

    # strip attributes (Faceting)

    strip.text = ggplot2::element_text(size = base_size * 9.5 / 8.5),

    # don't create a complete format
    complete = FALSE

  )

}
