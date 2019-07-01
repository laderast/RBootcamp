library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes()) + 
  ## add boxplots and violin plots as separate layers.
  geom_boxplot() + geom_violin()

