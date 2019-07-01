library(dplyr)
biopics <- readRDS("data/biopics.rds")

threeVarTable <- biopics %>% 
  select(----, ----, ----)

head(threeVarTable)