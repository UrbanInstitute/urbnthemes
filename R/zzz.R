.onAttach <- function(libname, pkgname) {

  # set os options
  if (.Platform$OS.type == 'windows') {
    packageStartupMessage('Setting Windows options...')
    grDevices::windows.options(width = 8.33333333333333, height = 5.55555555555556)
    grDevices::windowsFonts(Lato = grDevices::windowsFont("Lato"))
  } else {
    packageStartupMessage('Setting Mac/Linux options...')
    grDevices::quartz.options(width = 8.33333333333333, height = 5.55555555555556, dpi = 72)
  }
}
