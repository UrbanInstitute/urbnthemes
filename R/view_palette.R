#' The Urban Institute [ggplot2] theme
#'
#' \code{view_palette} displays the colors and hexadecimal codes for \code{palette_urbn_*} vectors.
#'
#' @param palette A \code{palette_urbn_*} vector from \code{library(urbnthemes)}.
#'   Options are `palette_urbn_diverging`, `palette_urbn_politics`,
#'   `palette_urbn_quintile`, `palette_urbn_cyan`, `palette_urbn_gray`,
#'   `palette_urbn_yellow`, `palette_urbn_magenta`, `palette_urbn_green`,
#'   `palette_urbn_spacegray`, and `palette_urbn_red`.
#'
#' @examples
#' view_palette()
#' view_palette(palette_urbn_cyan)
#'
#' @md
#'
#' @export
view_palette <- function(palette = palette_urbn_main) {

  color_palette <- unname(rev(palette))

  print(paste0("c(", paste(color_palette, collapse = ", "), ")"))

  data <- tibble::tibble(x = 1,
         y = 1:length(color_palette),
         colors = factor(color_palette, levels = color_palette))

  ggplot2::ggplot(data = data) +
    ggplot2::geom_point(ggplot2::aes_string("x", "y", color = "colors"), size = 15) +
    ggplot2::geom_text(ggplot2::aes_string(2, "y"), label = color_palette) +
    ggplot2::scale_color_manual(values = color_palette) +
    ggplot2::scale_x_continuous(limits = c(0, 3)) +
    theme_urbn_map() +
    ggplot2::guides(color = FALSE)

}
