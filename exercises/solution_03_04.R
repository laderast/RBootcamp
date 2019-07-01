library(dplyr)
biopics <- readRDS("data/biopics.rds")

#add your filter statement here
crimeMovies <- filter(biopics, type_of_subject == "Criminal")
#show number of crime movies
nrow(crimeMovies)
