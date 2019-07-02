library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics_sorted <- biopics %>% 
  arrange(year_release, lead_actor_actress)

head(biopics_sorted)
