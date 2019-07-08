library(dplyr)
library(ggplot2)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# draw a scatterplot of weight (x-axis) vs total_mercury (y axis) 
# and color by fisherman category
ggplot(fishdata,aes(___,___,color=___))+___

# draw a scatterplot of fishmlwk (x-axis) vs total_mercury (y axis) 
# and color by fisherman category
ggplot(fishdata,aes(___,___,color=___))+___

