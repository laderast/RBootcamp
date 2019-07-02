library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics_sorted <- biopics %>%
  arrange(------, ------)

head(biopics_sorted)