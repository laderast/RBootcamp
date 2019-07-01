library(dplyr)
library(tidyr)
library(stringr)
dem_score <- read.csv("data/dem_score.csv")

gatheredData <- dem_score %>% 
  gather(key=----, value=-----, -country) %>%
  mutate(year=str_replace(year, "X",""))

head(gatheredData)
