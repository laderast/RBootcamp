library(dplyr)
biopics <- readRDS("data/biopics.rds")

and_result <- filter(biopics, year_release > 1980 & type_of_subject == 'Criminal')
nrow(and_result)

or_result <- filter(biopics, year_release > 1980 | type_of_subject == 'Criminal')
nrow(or_result)
