library(ggplot2)
pets <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/pets.csv")
#map the right variable in pets to fill
ggplot(pets, aes(x=animal, fill= )) + 
  geom_bar(color="black")
