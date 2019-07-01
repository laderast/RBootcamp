library(dplyr)
biopics <- readRDS("data/biopics.rds")

filteredBiopics <- filter(biopics, !is.na(box_office))

#show number of rows in biopics
nrow(biopics)
#show number of rows in filteredBiopics
nrow(filteredBiopics)
