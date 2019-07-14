library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics_sorted <- biopics %>% 
  arrange(year_release, box_office)

head(biopics_sorted)
