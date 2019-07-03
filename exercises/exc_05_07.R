library(tidyverse)
library(broom)

fishdata <- read_csv("data/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)

# draw a scatterplot of weight (x-axis) vs total_mercury (y axis) and color by fisherman category
ggplot(fishdata,aes(___,___,color=___))+___

# draw a scatterplot of fishmlwk (x-axis) vs total_mercury (y axis) and color by fisherman category
ggplot(fishdata,aes(___,___,color=___))+___

