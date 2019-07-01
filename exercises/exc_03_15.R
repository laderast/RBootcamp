library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics %>% 
  group_by(type_of_subject) %>% 
  summarize(count=n())