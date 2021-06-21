context("urbnthemes - too many colors")

test_that("Including more than 8 categories for color and fill throws an error ", {

  # set_urbn_defaults(style = "print", base_family = "Calibri")


  broken_plot_too_many_colors <- ggplot2::ggplot(
    ggplot2::mpg,
    ggplot2::aes(cty, hwy, color = manufacturer)
  ) +
    urbnthemes::geom_point()

  expect_error(
    print(broken_plot_too_many_colors)
  )

  working_plot <- ggplot2::ggplot(
    ggplot2::mpg,
    ggplot2::aes(cty, hwy, color = manufacturer)
  ) +
    geom_point() +
    ggplot2::scale_color_discrete()


  expect_silent(
    print(working_plot)
  )

  broken_plot2_too_many_colors <- ggplot2::ggplot(
    ggplot2::mpg,
    ggplot2::aes(manufacturer, hwy, fill = manufacturer)
  ) +
    geom_col()

  expect_error(
    print(broken_plot2_too_many_colors)
  )

  working_plot2 <- ggplot2::ggplot(
    ggplot2::mpg,
    ggplot2::aes(manufacturer, hwy, fill = manufacturer)
  ) +
    geom_col() +
    ggplot2::scale_fill_discrete()

  expect_silent(
    print(working_plot2)
  )

})

