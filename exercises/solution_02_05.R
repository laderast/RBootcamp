library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x=animal,fill=shotsCurrent)) + 
  geom_bar(position= "fill", color="black")
