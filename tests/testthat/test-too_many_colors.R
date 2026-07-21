context("urbnthemes - too many colors")

test_that("Including more than 8 categories for color and fill issues a warning", {

  # set_urbn_defaults(style = "print", base_family = "Calibri")


  plot_too_many_colors <- ggplot2::ggplot(
    ggplot2::mpg,
    ggplot2::aes(cty, hwy, color = manufacturer)
  ) +
    ggplot2::geom_point()

  expect_warning(
    print(plot_too_many_colors),
    "urbnthemes is designed for a max of 8 colors"
  )

  working_plot <- ggplot2::ggplot(
    ggplot2::mpg,
    ggplot2::aes(cty, hwy, color = manufacturer)
  ) +
    ggplot2::geom_point() +
    ggplot2::scale_color_discrete()


  expect_silent(
    print(working_plot)
  )

  plot2_too_many_colors <- ggplot2::ggplot(
    ggplot2::mpg,
    ggplot2::aes(manufacturer, hwy, fill = manufacturer)
  ) +
    urbnthemes::geom_col()

  expect_warning(
    print(plot2_too_many_colors),
    "urbnthemes is designed for a max of 8 colors"
  )

  working_plot2 <- ggplot2::ggplot(
    ggplot2::mpg,
    ggplot2::aes(manufacturer, hwy, fill = manufacturer)
  ) +
    urbnthemes::geom_col() +
    ggplot2::scale_fill_discrete()

  expect_silent(
    print(working_plot2)
  )

})

