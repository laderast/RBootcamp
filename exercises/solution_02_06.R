library(dplyr)
biopics <- readRDS("data/biopics.rds")

filter(biopics, year_release > 1980 & type_of_subject == 'criminal')
filter(biopics, year_release > 1980 | type_of_subject == 'criminal')
