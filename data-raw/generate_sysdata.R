# source & save various data creation files for internal sysdata.rda
source("data-raw/urbn_geofacet.R")

save(urbn_geofacet,
     file = "R/sysdata.rda",
     compress = "bzip2")
