library(ggplot2)
pets <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/pets.csv")
##show a barplot and count by name and fill by animal
ggplot(pets, aes(x=name)) + geom_bar() + 
    ##we make the x axis text angled for better legibility
    theme(axis.text.x = element_text(angle=45))

