library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x= animal, y= weight)) + geom_boxplot()
