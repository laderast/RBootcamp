library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x=ageCategory, fill=animal)) + 
  #what argument goes here?
  geom_bar(position = "fill") +
  facet_wrap(facets=~shotsCurrent, scale = "free_x")