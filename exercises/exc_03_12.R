library(dplyr)
biopics <- readRDS("data/biopics.rds")

#statement 1
biopics %>% 
  filter(year_release > 1998) %>% 
  head()

#statement 2
biopics %>% 
  mutate(isNewer = year_release > 1998) %>% 
  head()