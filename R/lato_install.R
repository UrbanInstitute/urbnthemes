#' Import and register Lato font
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' \code{lato_install()} has been deprecated because its name was ambiguous. Please use \code{lato_import()}.
#'
#' @md
#' @export
lato_install <- function() {

  lifecycle::deprecate_stop(
    when = "0.0.3",
    what = "lato_install()",
    with = "lato_import()"
  )

}
