library(fivethirtyeight)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
options(tibble.width = Inf)
#add your filter statement here
crimeMovies <- filter(biopics, type_of_subject == "Criminal")

#show number of crime movies
nrow(crimeMovies)
