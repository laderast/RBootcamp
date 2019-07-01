library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x=animal, y=weight, fill=animal)) + 
#what should go next?