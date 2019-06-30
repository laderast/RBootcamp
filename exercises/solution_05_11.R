library(readr)
library(dplyr)
library(ggplot2)
library(broom)

fishdata <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
# here is our model
fit_multiple <- lm(total_mercury~fisherman+weight+fishmlwk,data=fishdata)

# ok where is that R^2? look at the names of the summary list again
names(summary(fit_multiple))

# call the name we need
summary(fit_multiple)$r.squared

# or we can use glance
glance(fit_multiple)

# and select that R^2
glance(fit_multiple)%>%select(r.squared)
