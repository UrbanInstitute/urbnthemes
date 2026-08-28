.onAttach <- function(libname, pkgname) {

  # check ggplot2 version
  if (unlist(utils::packageVersion("ggplot2"))[1] < 3) {
    packageStartupMessage(
      "Warning: urbnthemes requires ggplot2 version 3.0.0 or higher."
      )
  }

  # check that ggplot2 is already loaded
  if (!"ggplot2" %in% (.packages())) {
    packageStartupMessage(
      "Warning: ggplot2 needs to be loaded before urbnthemes is loaded. Consider restarting your R session."
    )
  }

  # check for Lato font availability
  fonts <- systemfonts::system_fonts()
  lato_available <- any(grepl("[Ll]ato", fonts$family))

  if (!lato_available) {
    packageStartupMessage(
      "Note: Lato font not found. Run lato_import() for installation instructions."
    )
  }

  # recommend ragg for best font rendering
  if (!requireNamespace("ragg", quietly = TRUE)) {
    packageStartupMessage(
      "Tip: Install the 'ragg' package for better font rendering: install.packages('ragg')"
    )
  }

}

