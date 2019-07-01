library(dplyr)
biopics <- readRDS("data/biopics.rds")

#add your comparison to the end of this filter statement
crimeFilms <- filter(biopics, year_release > 1980 & 
    type_of_subject == "Criminal")
    
#show number of rows in crimeFilms

