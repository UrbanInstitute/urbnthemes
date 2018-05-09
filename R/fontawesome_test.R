#' Test for fontawesome import and registration
#'
#' \code{fontawesome_test} tests to see if fontawesome is imported and registered. fontawesome is used for glyphs with \code{library(waffle)} and can be installed from \href{https://github.com/hrbrmstr/waffle/tree/master/inst/fonts}{Bob Rudis's GitHub}.
#'
#' Import and register fontawesome in R with fontawesome_install().
#'
#' @md
#' @export
fontawesome_test <- function() {
  if (sum(grepl("fontawesome", extrafont::fonts())) > 0) {
    "fontawesome is imported and registered."
  } else {
    "fontawesome isn't imported and registered. Install from GitHub and important and register using fontawesome_install()."
  }
}
