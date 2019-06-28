library(readr)
library(dplyr)
library(ggplot2)
library(broom)

fishdata <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
# draw a scatterplot of weight (x-axis) vs total_mercury (y axis) and color by fisherman category
ggplot(fishdata,aes(___,___,color=___))+___

# draw a scatterplot of fishmlwk (x-axis) vs total_mercury (y axis) and color by fisherman category
ggplot(fishdata,aes(___,___,color=___))+___

