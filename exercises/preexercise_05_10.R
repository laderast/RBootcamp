library(dplyr)
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))
