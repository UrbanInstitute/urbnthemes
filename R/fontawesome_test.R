#' Test for FontAwesome import and registration
#'
#' \code{fontawesome_test} tests to see if FontAwesome is imported and registered. FontAwesome is used for glyphs with \code{library(waffle)} and can be installed from \href{https://github.com/hrbrmstr/waffle/tree/master/inst/fonts}{Bob Rudis's GitHub}.
#'
#' Import and register FontAwesome in R with fontawesome_install().
#'
#' @md
#' @export
fontawesome_test <- function() {
  if (sum(grepl("FontAwesome", extrafont::fonts())) > 0) {
    "FontAwesome is imported and registered."
  } else {
    "FontAwesome isn't imported and registered. Install from GitHub and import and register using fontawesome_install()."
  }
}
