dem_score <- read.csv("data/dem_score.csv")
library(dplyr)
library(tidyr)
library(stringr)

gatheredData <- dem_score %>% 
  pivot_longer(cols = -country, 
               names_to = "year",
               values_to = "score") %>%
  mutate(year=str_replace(year, "X",""))

spreadData <- gatheredData %>% 
  pivot_wider(names_from = "------",
              values_from = "------")

head(spreadData)
