#' Import and register Lato font
#'
#' \code{lato_import()} tests to see if Lato is imported and registered. If
#' Lato, isn't imported and registered, then \code{lato_import()} imports and
#' registers Lato with
#' \href{https://github.com/wch/extrafont}{library(extrafont)}.
#'
#' Note: Lato must be installed on your computer for \code{lato_import()} to
#' work. Lato is the Urban Institute's main font. To install, visit
#' \href{https://fonts.google.com/specimen/Lato}{Google fonts} and click
#' "Download family". Unzip and open each of the .ttf files and click install.
#'
#' Test to see if Lato is imported and registered with \code{lato_test()}.
#'
#' @md
#' @export
lato_import <- function() {

  if (sum(grepl("[Ll]ato$", extrafont::fonts())) > 0) {

    "Lato is already imported and registered."

  } else {

    # get a list of all fonts on the machine
    local_fonts <- systemfonts::system_fonts()

    # subset the list to just Lato fonts
    lato_fonts <- local_fonts[grepl(pattern = "[Ll]ato", x = local_fonts$family), ]

    # create a vector of directories where Lato fonts are located
    lato_directories <- unique(gsub("[Ll]ato.*\\.ttf", "", lato_fonts$path))

    # import the Lato fonts
    extrafont::font_import(paths = lato_directories, pattern = "[Ll]ato")

    # register the fonts
    extrafont::loadfonts()

    # test to confirm that Lato is imported and registered
    lato_test()

  }

}
