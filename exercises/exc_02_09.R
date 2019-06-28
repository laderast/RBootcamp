library(ggplot2)
pets <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/pets.csv")
ggplot(pets, aes(x=ageCategory, fill=)) + 
    #what argument goes here?
    geom_bar() +
    facet_wrap()
