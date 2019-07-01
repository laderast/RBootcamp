library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)
fertilityData <- read.csv("data/total_fertility.csv")
colnames(fertilityData)[1] <- "Total fertility rate"

fertilityTidy <- 
  gather(fertilityData, "Year", "fertilityRate", -`Total fertility rate`) %>% 
  select(Country = `Total fertility rate`, Year, fertilityRate) %>% 
  #remove na values (there are countries that have no information)
  filter(!is.na(fertilityRate)) %>% mutate(Year=str_replace(Year,"X",""))

write.csv(fertilityTidy, "data/fertility_tidy.csv")