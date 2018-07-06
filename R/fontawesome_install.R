#' Import and register Lato font
#'
#' \code{fontawesome_install} tests to see if FontAwesome is imported and registered. If FontAwesome, isn't imported and registered, then \code{fontawesome_install} imports and registers FontAwesome with \href{https://github.com/wch/extrafont}{library(extrafont)}.
#'
#' Note: FontAwesome must be installed on your computer for \code{fontawesome_install} to work.
#'
#' Test to see if FontAwesome is imported and registered with \code{fontawesome_test()}.
#'
#' @md
#' @export
fontawesome_install <- function() {
  if (sum(grepl("FontAwesome", extrafont::fonts())) > 0) {
    "FontAwesome is already imported and registered."
  } else {
    extrafont::font_import()
    extrafont::loadfonts()
    fontawesome_test()
  }
}
