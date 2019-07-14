library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics_sorted <- biopics %>% 
  arrange(year_release, country)

head(biopics_sorted)
