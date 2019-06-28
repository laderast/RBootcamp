library(ggplot2)
pets <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/pets.csv")
#Space for your answer here.
ggplot(pets, aes(x=ageCategory, fill=animal)) + geom_bar(position="fill") +
    facet_wrap(facets=~shotsCurrent, scale="free_x")
