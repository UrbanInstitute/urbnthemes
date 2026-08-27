context("urbnthemes - (scales.R)")

test_that("scale_fill_binned passes n.breaks through to ggplot2 binned scale", {
  p <- ggplot2::ggplot(
    mtcars,
    ggplot2::aes(x = wt, y = mpg, fill = qsec)
  ) +
    ggplot2::geom_point(shape = 21, size = 3) +
    scale_fill_binned(palette = "cyan", n.breaks = 4, nice.breaks = FALSE)

  sc <- p$scales$get_scales("fill")

  # verify argument forwarding
  expect_equal(sc$n.breaks, 4)
  expect_false(sc$nice.breaks)

  # sanity: scale exists and is binned
  expect_true(inherits(sc, "ScaleBinned"))
})