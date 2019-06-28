library(readr)
library(dplyr)
library(ggplot2)
library(broom)

fishdata <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
ggplot(fishdata,aes(x=weight,y=total_mercury,color=fisherman))+geom_point()

ggplot(fishdata,aes(x=fishmlwk,y=total_mercury,color=fisherman))+geom_point()
