context("urbnthemes - (urbn_save.R)")

# tests do not need to test the underlying ggsave function,
# just that the parameters are passed correctly and that the function runs without error

test_that("urbn_save runs without error", {
  p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(displ, hwy)) +
       ggplot2::geom_point()

  out_file <- tempfile(fileext = ".png")

  expect_error(urbn_save(out_file, plot = p), NA)
  expect_error(urbn_save(out_file, plot = p, size = "small"), NA)
  expect_error(urbn_save(out_file, plot = p, size = "medium"), NA)
  expect_error(urbn_save(out_file, plot = p, size = "large"), NA)
  expect_error(urbn_save(out_file, plot = p, size = "small", height = 3), NA)
  expect_error(urbn_save(out_file, plot = p, size = "medium", height = 3), NA)
  expect_error(urbn_save(out_file, plot = p, size = "large", height = 3), NA)
})

test_that("urbn_save passes expected dimensions for small size with default height", {
  p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(displ, hwy)) +
    ggplot2::geom_point()

  assign(".urbn_save_captured_dims", NULL, envir = .GlobalEnv)
  on.exit(rm(".urbn_save_captured_dims", envir = .GlobalEnv), add = TRUE)

  trace(
    what = "ggsave",
    where = asNamespace("ggplot2"),
    tracer = quote({
      assign(".urbn_save_captured_dims", list(
        width = width,
        height = height
      ), envir = .GlobalEnv)
      stop(".captured_dims.")
    }),
    print = FALSE
  )
  on.exit(untrace("ggsave", where = asNamespace("ggplot2")), add = TRUE)

  expect_error(
    urbn_save(tempfile(fileext = ".png"), plot = p, size = "small", height = NULL),
    "\\.captured_dims\\."
  )
  captured <- get(".urbn_save_captured_dims", envir = .GlobalEnv)
  expect_equal(unname(captured$width), 3.25)
  expect_equal(unname(captured$height), 2)

})