library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics %>%
  filter(country == "US")
