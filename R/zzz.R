.onAttach <- function(libname, pkgname) {

  # set os options
  if (.Platform$OS.type == 'windows') {
    packageStartupMessage('Setting Windows options...')
    windows.options(width = 8.33333333333333, height = 5.55555555555556)
    windowsFonts(Lato = windowsFont("Lato"))
  } else {
    message('Setting Mac/Linux options...')
    quartz.options(width = 8.33333333333333, height = 5.55555555555556, dpi = 72)
  }
}
