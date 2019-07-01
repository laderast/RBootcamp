library(dplyr)
biopics <- readRDS("data/biopics.rds")

mutate(biopics, subject= paste(subject, year_release))