#' Test for FontAwesome font availability
#'
#' \code{fontawesome_test()} checks if FontAwesome is installed on your system.
#' FontAwesome is used for glyphs with \code{library(waffle)}.
#'
#' @return Logical \code{TRUE} if FontAwesome is available, \code{FALSE} otherwise
#' @md
#' @export
fontawesome_test <- function() {

  fonts <- systemfonts::system_fonts()
  fa_available <- any(grepl("FontAwesome|Font Awesome", fonts$family, ignore.case = TRUE))

  if (fa_available) {
    message("FontAwesome is installed and ready to use.")
    invisible(TRUE)
  } else {
    message("FontAwesome is NOT installed. See ?fontawesome_install for instructions.")
    invisible(FALSE)
  }
}
