library(dplyr)
library(ggplot2)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# draw a scatterplot of weight (x-axis) vs total_mercury (y axis) 
# and color by fisherman category
ggplot(fishdata,aes(x=weight,y=total_mercury,color=fisherman))+
  geom_point()

# draw a scatterplot of fishmlwk (x-axis) vs total_mercury (y axis) 
# and color by fisherman category
ggplot(fishdata,aes(x=fishmlwk,y=total_mercury,color=fisherman))+
  geom_point()
