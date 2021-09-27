#' Test for Lato import and registration
#'
#' \code{lato_test} tests to see if Lato is imported and registered. Lato is
#' the Urban Institute's main font and can be installed from
#' \href{https://fonts.google.com/specimen/Lato}{Google fonts}.
#'
#' Import and register Lato in R with lato_install().
#'
#' @export
#'
lato_test <- function() {

  if (sum(grepl("[Ll]ato$", extrafont::fonts())) > 0) {

    "Lato is imported and registered."

  } else {

    "Lato isn't imported and registered. Install the Lato font from Google
    Fonts and import using lato_import(). See ?lato_import for more
    information."

  }
}
