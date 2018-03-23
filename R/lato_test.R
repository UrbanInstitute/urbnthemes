#' A [ggplot2] theme formatted in the Urban Institute style
#'
#' \code{lato_test} tests to see if Lato is installed and loaded. Lato is the Urban Institute's main font and can be installed from \href{https://fonts.google.com/specimen/Lato}{Google fonts}.
#'
#' Import Lato into R with lato_install().
#'
#' @md
#' @export
lato_test <- function() {
  if (sum(grepl("[Ll]ato$", extrafont::fonts())) > 0) {
    "Lato is installed and loaded."
  } else {
    "Lato isn't loaded. Install from Google Fonts and load using lato_install()."
  }
}
