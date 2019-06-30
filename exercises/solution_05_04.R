library(readr)
library(dplyr)
library(ggplot2)
library(broom)

fishdata <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
fishdata%>%group_by(fisherman)%>%summarize(mean_total_mercury = mean(total_mercury), sd_total_mercury = sd(total_mercury))
