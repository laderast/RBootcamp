library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x=ageCategory, fill= -----)) + 
    #what argument goes here?
    geom_bar(position = ---) +
    facet_wrap(facets = ----, scale = ----)
