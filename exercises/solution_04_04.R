dem_score <- read.csv("data/dem_score.csv")
library(tidyr)
library(stringr)

gatheredData <- dem_score %>% 
  gather(key=year, value=score, -country) %>%
  mutate(year=str_replace(year, "X",""))

spreadData <- gatheredData %>% 
  spread(key=country, value=score)

head(spreadData)
