library(tidyverse)

urbn_geofacet <- tibble(
  row = c(1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4,
          4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7,
          7, 7, 8, 8, 8),
  col = c(1, 11, 6, 10, 11, 1, 2, 3, 4, 5, 6, 7, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 2, 3, 4, 5, 6, 7, 8, 9, 4, 5, 6, 7, 8, 1, 4, 9),
  code = c("AK", "ME", "WI", "VT", "NH", "WA", "ID", "MT", "ND", "MN", "IL", "MI", "NY", "MA", "OR", "NV", "WY", "SD", "IA", "IN", "OH", "PA", "NJ", "CT", "RI", "CA", "UT", "CO", "NE", "MO", "KY", "WV", "VA", "MD", "DE", "AZ", "NM", "KS", "AR", "TN", "NC", "SC", "DC", "OK", "LA", "MS", "AL", "GA", "HI", "TX", "FL"),
  name = c("Alaska", "Maine", "Wisconsin", "Vermont", "New Hampshire", "Washington", "Idaho", "Montana", "North Dakota", "Minnesota", "Illinois", "Michigan", "New York", "Massachusetts", "Oregon", "Nevada", "Wyoming", "South Dakota", "Iowa", "Indiana", "Ohio", "Pennsylvania", "New Jersey", "Connecticut", "Rhode Island", "California", "Utah", "Colorado", "Nebraska", "Missouri", "Kentucky", "West Virginia", "Virginia", "Maryland", "Delaware", "Arizona", "New Mexico", "Kansas", "Arkansas", "Tennessee", " North Carolina", "South Carolina", " District of Columbia", "Oklahoma", "Louisiana", "Mississippi", "Alabama", "Georgia", "Hawaii", "Texas", "Florida")
)

save(urbn_geofacet, file = "data/urbn_geofacet.rda", compress = "bzip2")
