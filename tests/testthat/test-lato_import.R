context("urbnthemes - (lato_import.R)")

test_that("lato_install() throws and error because it is deprecated ", {
  expect_error(lato_install())
})

