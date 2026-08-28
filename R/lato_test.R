#' Test for Lato font availability
#'
#' \code{lato_test()} checks if Lato is installed on your system using
#' \code{systemfonts}. Lato is the Urban Institute's main font and can be
#' installed from \href{https://fonts.google.com/specimen/Lato}{Google fonts}.
#'
#' @return Logical \code{TRUE} if Lato is available, \code{FALSE} otherwise
#' @seealso \code{\link{lato_import}} for installation instructions
#' @export
#'
lato_test <- function() {

  fonts <- systemfonts::system_fonts()
  lato_available <- any(grepl("[Ll]ato", fonts$family))

  if (lato_available) {
    message("Lato is installed and ready to use.")
    invisible(TRUE)
  } else {
    message("Lato is NOT installed. Run lato_import() for installation instructions.")
    invisible(FALSE)
  }

}
