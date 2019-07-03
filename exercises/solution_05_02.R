library(tidyverse)
library(broom)

fishdata <- read_csv("data/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
ggplot(fishdata, aes(x=fisherman, y=total_mercury)) + geom_boxplot() +
  stat_summary(fun.y="mean",geom="point",pch=3,color="red")
