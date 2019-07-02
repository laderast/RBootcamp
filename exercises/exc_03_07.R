library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopicsArt <- biopics %>%
  filter(---- %in% ------)

head(biopicsArt)