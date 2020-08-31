library(dplyr)
library(tidyr)
library(stringr)
dem_score <- read.csv("data/dem_score.csv")

gatheredData <- dem_score %>% 
  pivot_longer(cols = -country, 
               names_to = "-----",
               values_to = "-----") %>%
  mutate(year=str_replace(year, "X",""))

head(gatheredData)
