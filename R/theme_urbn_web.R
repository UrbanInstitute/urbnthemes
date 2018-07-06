#' The Urban Institute [ggplot2] theme
#'
#' \code{theme_urbn_web} provides a [ggplot2] theme formatted according to the
#' Urban Institute style guide for web, with sensible defaults.
#'
#' @import extrafont
#' @import ggrepel
#' @md
#' @param base_family,base_size base font family and size
#' @param base_line_size,base_rect_size base line and rectangle sizes
#' @export

theme_urbn_web <- function(base_size = 12L, base_family = "Lato",
                           base_line_size = base_size / 24L,
                           base_rect_size = base_size / 24L) {

  half_line <- base_size / 2L

  ggplot2::theme(

    # main attributes

    line = element_line(colour = "#000000",
                        size = base_line_size,
                        linetype = 1L,
                        lineend = "butt"),
    rect = element_rect(fill = "#FFFFFF",
                        colour = "#000000",
                        size = base_rect_size,
                        linetype = 1L),
    text = element_text(family = base_family,
                        face = "plain",
                        colour = "#000000",
                        size = base_size,
                        hjust = 0.5,
                        vjust = 0.5,
                        angle = 0,
                        lineheight = 0.9,
                        margin = margin(),
                        debug = FALSE),

    # Plot Attributes

    plot.tag = element_text(size = base_size * 1.5,
                            hjust = 0L,
                            vjust = 0L,
                            face = "bold",
                            margin = margin(b = 10L)),
    plot.tag.position = "topleft",
    plot.title = element_text(size = base_size * 1.5,
                              hjust = 0L,
                              vjust = 0L,
                              face = "bold",
                              margin = margin(b = 10L)),
    plot.subtitle = element_text(size = base_size * 7L / 6L,
                                 hjust = 0L,
                                 vjust = 0L,
                                 margin = margin(b = 10L)),
    plot.caption = element_text(size = base_size * 2L / 3L,
                                hjust = 1L,
                                vjust = 1L,
                                margin = margin(t = half_line * 0.9)),
    plot.background = NULL,

    plot.margin = margin(half_line, half_line, half_line, half_line),

    # axis attributes

    axis.text = element_text(size = base_size),
    axis.text.x = element_text(vjust = 1, margin = margin(t = 4L)),
    axis.text.y = element_text(hjust = 1),
    axis.text.x.top = NULL,
    axis.text.y.right = NULL,

    axis.title = element_text(face = "italic",
                              size = base_size),
    axis.title.x = element_text(margin = margin(t = 8L)),
    axis.title.y = element_text(angle = 90L,
                                margin = margin(r = 4L)),
    axis.title.x.top = NULL,
    axis.title.y.right = NULL,

    axis.ticks = element_line(),
    axis.ticks.length = unit(4L, "pt"),
    axis.ticks.x = element_line(colour = NULL,
                                size = NULL,
                                linetype = NULL,
                                lineend = NULL),
    axis.ticks.y = element_blank(),

    axis.line = element_line(),
    axis.line.x = element_line(colour = NULL,
                               size = NULL,
                               linetype = NULL,
                               lineend = NULL),
    axis.line.y = element_blank(),

    # legend attributes

    legend.background = element_blank(),

    legend.spacing = unit(20L, "pt"),
    legend.spacing.x = NULL,
    legend.spacing.y = NULL,

    legend.key = element_blank(),
    legend.key.size = unit(10L, "pt"),
    legend.key.height = NULL,
    legend.key.width = NULL,

    legend.text = NULL,
    legend.text.align = NULL,
    legend.title = element_blank(),
    legend.title.align = NULL,

    legend.position = "top",
    legend.direction = "horizontal",
    legend.justification = NULL,
    legend.margin = margin(t = 6L, r = 0L, b = 6L, l = 0L, "pt"),

    legend.box = "horizontal",
    legend.box.margin = NULL,
    legend.box.background = NULL,
    legend.box.spacing = NULL,

    # panel attributes

    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.ontop = FALSE,

    panel.spacing = unit(6L, "pt"),
    panel.spacing.x = NULL,
    panel.spacing.y = NULL,

    panel.grid = NULL,
    panel.grid.major = element_line(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(colour = "#dedddd"),
    panel.grid.minor = element_line(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),

    # strip attributes (Faceting)

    strip.background = element_rect(fill = "#dedddd",
                                    colour = NA,
                                    size = 10L),
    strip.text = element_text(face = "bold",
                              size = base_size,
                              margin = margin(t = 0L, r = 0L, b = 0L, l = 0L)),

    strip.text.x = element_text(margin = margin(t = 4.5, b = 4.5)),
    strip.text.y = element_text(angle = -90L,
                                margin = margin(l = 4.5, r = 4.5)),

    strip.placement = "inside",
    strip.placement.x =  NULL,
    strip.placement.y =  NULL,

    strip.switch.pad.grid = unit(0.1, "cm"),
    strip.switch.pad.wrap = unit(0.1, "cm"),

    # create a complete format
    complete = TRUE

  )
}
