# R CMD check runs tests against a pdf() device, which needs Lato registered
# as a PDF font via extrafont; interactive sessions resolve it from system
# fonts directly and don't hit this path.
try(extrafont::loadfonts(device = "pdf", quiet = TRUE), silent = TRUE)
