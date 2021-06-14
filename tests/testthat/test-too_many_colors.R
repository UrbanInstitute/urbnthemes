context("urbnthemes - too many colors")

test_that("Including more than 8 categories for color and fill throws an error ", {

  set_urbn_defaults(style = "print")

  expect_error(
    ggplot2::ggplot(
      ggplot2::mpg,
      ggplot2::aes(cty, hwy, color = manufacturer)
    ) +
      urbnthemes::geom_point()
  )

  expect_success(
    ggplot2::ggplot(
      ggplot2::mpg,
      ggplot2::aes(cty, hwy, color = manufacturer)
    ) +
      geom_point() +
      ggplot2::scale_color_discrete()
  )

  expect_error(
    ggplot2::ggplot(
      ggplot2::mpg,
      ggplot2::aes(manufacturer, hwy, fill = manufacturer)
    ) +
      geom_col()
  )

  expect_success(
    ggplot2::ggplot(
      ggplot2::mpg,
      ggplot2::aes(manufacturer, hwy, fill = manufacturer)
    ) +
      geom_col() +
      ggplot2::scale_fill_discrete()
  )

})

