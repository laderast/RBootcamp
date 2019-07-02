library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopicsArt <- biopics %>% 
  filter(type_of_subject %in% c("Musician", "Artist", "Singer"))

head(biopicsArt)
