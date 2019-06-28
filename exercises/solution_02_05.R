library(ggplot2)
pets <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/pets.csv")
ggplot(pets, aes(x=animal,fill=shotsCurrent)) + 
  geom_bar(position= "fill", color="black")
