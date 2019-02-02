library(tidyverse)
library(urbnthemes)
library(hexSticker)

set_urbn_defaults(style = "print")

data <- tibble(
  x = sort(rep(0:7, 8)),
  y = rep(0:7, 8))

urbnthemes <- data %>%
  ggplot(aes(x, y)) +
  geom_point(color = "#9d9d9d", shape = 15, size = 0.4) +
  annotate("rect", xmin = 3.5, xmax = 7.5, ymin = 2.5, ymax = 5.5, fill = "#f5f5f5") +
  geom_text(aes(6.5, 4.7, label = "urbn"),
            size = 20,
            color = "#1696d2") +
  geom_text(aes(7, 3, label = "themes"),
            size = 10) +
  scale_x_continuous(limits = c(-5, 10)) +
  scale_y_continuous(limits = c(-5, 10)) +
  theme(axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank())

sticker(urbnthemes,
        package = "",
        filename = "man/figures/hexsticker.png",
        p_size = 8,
        s_x = 0.85,           # subplot position
        s_y = 0.85,           # subplot position
        s_width = 2,          # subplot width
        s_height = 2,         # subplot height
        p_color = "#1696d2",
        h_fill = "#f5f5f5",
        h_size = 2,           # no border
        h_color = "#1696d2"
)
