.onAttach <- function(libname, pkgname) {

  # set os options
  if (.Platform$OS.type == "windows") {
    packageStartupMessage("Setting Windows options...")
    grDevices::windows.options(width = 8.33333333333333,
                               height = 5.55555555555556)
    grDevices::windowsFonts(Lato = grDevices::windowsFont("Lato"))
    grDevices::windowsFonts(FontAwesome = grDevices::windowsFont("FontAwesome"))
  } else {
    packageStartupMessage("Setting Mac/Linux options...")
    grDevices::quartz.options(width = 8.33333333333333,
                              height = 5.55555555555556,
                              dpi = 72)
  }

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

}
