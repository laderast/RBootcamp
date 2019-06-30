library(ggplot2)
pets <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/pets.csv")
##Show a barplot and count by name and fill by animal
##theme() allows us to angle the text labels so that we can read them
ggplot(pets, aes(x=   )) + geom_bar() + 
    ##We make the x axis text angled 
    ##for better legibility
    theme(axis.text.x = element_text(angle=45))
