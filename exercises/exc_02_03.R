library(ggplot2)
pets <- read.csv("data/pets.csv")

#map the right variable in pets to fill
ggplot(pets, aes(x=animal, fill= ----)) + 
  geom_bar(color="black")
