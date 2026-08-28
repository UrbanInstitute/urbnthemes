#' Check Lato font availability
#'
#' \code{lato_import()} checks if Lato is installed on your system using
#' \code{systemfonts}. If Lato is found, it confirms availability. If not,
#' it provides installation instructions.
#'
#' With modern R graphics (using \code{ragg} or \code{systemfonts}), fonts
#' no longer need to be "imported" or "registered" - they work automatically
#' if installed on your system.
#'
#' Note: Lato must be installed on your computer for \code{lato_import()} to
#' work. Lato is the Urban Institute's main font. To install, visit
#' \href{https://fonts.google.com/specimen/Lato}{Google fonts} and click
#' "Download family". Unzip and open each of the .ttf files and click install.
#'
#' For best results, use the \code{ragg} graphics device in your RMarkdown
#' or Quarto documents by adding to your YAML header:
#' \preformatted{
#' knitr:
#'   opts_chunk:
#'     dev: "ragg_png"
#' }
#'
#' Test to see if Lato is imported and registered with \code{lato_test()}.
#'
#' @md
#' @export
lato_import <- function() {

  fonts <- systemfonts::system_fonts()
  lato_available <- any(grepl("[Ll]ato", fonts$family))

  if (lato_available) {

    message("Lato is installed and available!")
    message("\nTo use Lato in your plots, use the ragg graphics device:")
    message("  - In RMarkdown/Quarto: add `dev: ragg_png` to chunk options")
    message("  - In scripts: use ragg::agg_png() or set options(device = ragg::agg_png)")

    invisible(TRUE)

  } else {

    message("Lato is NOT installed on your system.")
    message("\nTo install Lato:")
    message("1. Visit https://fonts.google.com/specimen/Lato")
    message("2. Click 'Download family'")
    message("3. Unzip and install the .ttf files:")
    message("   - macOS: Double-click each .ttf file and click 'Install Font'")
    message("   - Windows: Right-click each .ttf file and select 'Install'")
    message("   - Linux: Copy .ttf files to ~/.fonts/ and run fc-cache -fv")
    message("\nAfter installing, restart R and run lato_test() to verify.")

    invisible(FALSE)

  }

}
