#' Import and register Lato font
#'
#' \code{lato_install} tests to see if Lato is imported and registered. If Lato, isn't imported and registered, then \code{lato_install} imports and registers Lato with \href{https://github.com/wch/extrafont}{library(extrafont)}.
#'
#' Note: Lato must be installed on your computer for \code{lato_install} to work. Lato is the Urban Institute's main font and can be installed from \href{https://fonts.google.com/specimen/Lato}{Google fonts}.
#'
#' Test to see if Lato is imported and registered with \code{lato_test()}.
#'
#' @md
#' @export
lato_install <- function() {
  if (sum(grepl("[Ll]ato$", extrafont::fonts())) > 0) {
    "Lato is already imported and registered."
  } else {
    extrafont::font_import()
    extrafont::loadfonts()
    lato_test()
  }
}
