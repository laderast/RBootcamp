library(tidyr)
library(dplyr)
library(ggplot2)
fertilityData <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/total_fertility.csv", check.names = FALSE)

colnames(fertilityData)[1] <- "Total fertility rate"

fertilityTidy <- 
  gather(fertilityData, "Year", "fertilityRate", -`Total fertility rate`) %>% 
  select(Country = `Total fertility rate`, Year, fertilityRate) %>% 
  #remove na values (there are countries that have no information)
  filter(!is.na(fertilityRate))

fertilityMeanByCountry <- fertilityTidy %>% 
        group_by(Country) %>% summarize(meanCountryRate=mean(fertilityRate))
    
#show fertlityMeanByCountry
fertilityMeanByCountry
        
fertilityMeanByYear <- fertilityTidy %>% 
        group_by(Year) %>% summarize(meanYearRate=mean(fertilityRate))
        
#show fertilityMeanByYear
fertilityMeanByYear
