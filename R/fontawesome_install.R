#' Check FontAwesome font availability
#'
#' \code{fontawesome_install()} checks if FontAwesome is installed on your system
#' and provides installation instructions if not.
#'
#' Note: FontAwesome must be installed on your computer.
#'
#' @return A message indicating whether FontAwesome is available
#' @seealso \code{\link{fontawesome_test}}
#' @md
#' @export
fontawesome_install <- function() {

  fonts <- systemfonts::system_fonts()
  fa_available <- any(grepl("FontAwesome|Font Awesome", fonts$family, ignore.case = TRUE))

  if (fa_available) {
    message("FontAwesome is already installed and available.")
    invisible(TRUE)
  } else {
    message("FontAwesome is NOT installed on your system.")
    message("\nTo install FontAwesome:")
    message("1. Visit https://fontawesome.com/download")
    message("2. Download 'Font Awesome Free for Desktop'")
    message("3. Install the .ttf or .otf files on your system")
    message("\nAfter installing, restart R and run fontawesome_test() to verify.")
    invisible(FALSE)
  }

}
