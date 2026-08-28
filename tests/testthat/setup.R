# The default pdf() device used by R CMD check can't resolve system fonts
# like Lato and errors with "invalid font type". ragg's device resolves fonts
# via systemfonts, so use it as the default graphics device during tests.
if (requireNamespace("ragg", quietly = TRUE)) {
  options(device = function(...) ragg::agg_png(tempfile(fileext = ".png"), ...))
}
