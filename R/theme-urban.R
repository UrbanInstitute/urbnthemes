#' A [ggplot2] theme formatted in the Urban Institute style
#'
#' \code{theme_urban} provides a [ggplot2] theme formatted according to the
#' Urban Institute style guide, with sensible defaults.
#'
#' @md
#' @param base_family,base_size base font family and size
#' @param plot_title_size,plot_title_face,plot_title_margin plot title size typeface and margin
#' @param plot_subtitle_size,plot_subtitle_face,plot_subtitle_margin plot subtitle size typeface and margin
#' @param plot_caption_size,plot_caption_face,plot_caption_margin plot caption size typeface and margin
#' @param plot_margin plot margin (specify with [ggplot2::margin])
#' @param axis_title_size,axis_title_face axis title size and typeface
#' @param axis_text_size,axis_text_face axis title size and typeface
#' @param legend_position,legend_direction,legend_box legend position layout and arrangement
#' @param panel_ontop place the panel over the data layers
#' @export

theme_urban <- function(
  base_family = 'Lato', base_size = 12,
  plot_title_size = 18L, plot_title_face = 'bold', plot_title_margin = 8,
  plot_subtitle_size = 14L, plot_subtitle_face = 'plain', plot_subtitle_margin = 10,
  plot_caption_size = 8L, plot_caption_face = 'plain',
  plot_caption_margin = base_size / 2 * 0.9,
  plot_margin = margin(10L, 10L, 10L, 10L),
  axis_title_size = 12L, axis_title_face = 'italic',
  axis_text_size = 12L, axis_text_face = 'plain',
  legend_position = 'top', legend_direction = 'horizontal', legend_box = 'horizontal',
  panel_ontop = FALSE) {

  # main attributes
  ret <- ggplot2::theme(
    line = element_line(colour = "#000000",
                        size = 0.5,
                        linetype = 1L,
                        lineend = "butt"),

    rect = element_rect(fill = "#FFFFFF",
                        colour = "#000000",
                        size = 0.5,
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
                        debug = FALSE)
    )

  # plot attributes
  ret <- ret + theme(
    # plot title attributes
    plot.title = element_text(size = plot_title_size,
                              face = plot_title_face,
                              hjust = 0,
                              margin = margin(b = plot_title_margin)),
    # plot subtitle attributes
    plot.subtitle = element_text(size = plot_subtitle_size,
                                 face = plot_subtitle_face,
                                 hjust = 0,
                                 margin = margin(b = plot_subtitle_margin)),
    # plot caption attributes
    plot.caption = element_text(size = plot_caption_size,
                                face = plot_caption_face,
                                hjust = 1,
                                vjust = 1,
                                margin = margin(t = plot_caption_margin)),
    # plot margin and background
    plot.background = NULL,
    plot.margin = plot_margin
    )

  # axis attributes
  ret <- ret + theme(
    # axis title attributes
    axis.title = element_text(size = axis_title_size,
                              face = axis_title_face),
    axis.title.x = element_text(margin = margin(t = 8)),
    axis.title.y = element_text(angle = 90,
                                margin = margin(r = 4)),

    axis.text = element_text(size = axis_text_size,
                             face = axis_text_face),
    axis.text.x = element_text(margin = margin(t = 4)),
    axis.text.y = NULL,
    axis.text.x.top = NULL,
    axis.text.y.right = NULL,

    axis.ticks = element_line(),

    axis.title.x.top = NULL,
    axis.title.y.right = NULL,


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
    axis.line.y = element_blank()
    )

  # legend attributes
  ret <- ret + theme(
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

    legend.position = legend_position,
    legend.direction = legend_direction,
    legend.justification = NULL,
    legend.margin = margin(t = 6, r = 0, b = 6, l = 0, "pt"),

    legend.box = legend_box,
    legend.box.margin = NULL,
    legend.box.background = NULL,
    legend.box.spacing = NULL
  )

  # panel attributes
  ret <- ret + theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.ontop = panel_ontop,

    panel.spacing = unit(6L, "pt"),
    panel.spacing.x = NULL,
    panel.spacing.y = NULL,

    panel.grid.major = element_line(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(colour = "#DEDDDD"),
    panel.grid.minor = element_line(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank()
  )

  # strip attributes (facetting)
  ret <- ret + theme(
    strip.background = element_rect(fill = "#dedddd",
                                    colour = NA,
                                    size = 10),
    strip.text = element_text(face = "bold",
                              size = rel(0.5)),

    strip.text.x = element_text(margin = margin(t = 4.5, b = 4.5)),
    strip.text.y = element_text(angle = -90,
                                margin = margin(l = 4.5, r = 4.5)),

    strip.placement = "inside",
    strip.placement.x =  NULL,
    strip.placement.y =  NULL,

    strip.switch.pad.grid = unit(0.1, "cm"),
    strip.switch.pad.wrap = unit(0.1, "cm")
  )

  # complete theme
  ret <- ret + theme(complete = T)

  ret

}

#' A [ggplot2] map theme formatted in the Urban Institute style
#'
#' \code{urban_map} provides a [ggplot2] theme for maps.
#'
#' @export
urban_map <- function() {

  ret <- ggplot2::theme(
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    axis.line = element_blank()
  )

  ret

}
