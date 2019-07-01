library(tidyr)
library(dplyr)
library(ggplot2)
fertilityTidy <- read.csv("data/fertility_tidy.csv")

fertilityMeanByCountry <- fertilityTidy %>% 
  group_by(Country) %>% 
  summarize(meanCountryRate=mean(fertilityRate))
    
#show fertlityMeanByCountry
fertilityMeanByCountry
        
fertilityMeanByYear <- fertilityTidy %>% 
  group_by(Year) %>% 
  summarize(meanYearRate=mean(fertilityRate))
        
#show fertilityMeanByYear
fertilityMeanByYear
