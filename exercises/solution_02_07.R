library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x=name)) + geom_bar() + 
  facet_wrap(facets=~shotsCurrent, scale= "free_x") +
  theme(axis.text.x = element_text(angle=45))