library(dplyr)
biopics <- readRDS("data/biopics.rds")

threeVarTable <- biopics %>% 
  select(movieTitle=title, box_office, subject_sex)

head(threeVarTable)