library(readr)
library(dplyr)
library(ggplot2)
library(broom)

fishdata <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
fishTtest <- t.test(total_mercury~fisherman,data=fishdata)

#use tidy here
tidyTtest <- tidy()

#glimpse your output
glimpse()

# extract a p-value
tidyTtest$

