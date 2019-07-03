library(tidyverse)
library(broom)

fishdata <- read_csv("data/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)

# fit the univariate model
fit_univariate <- lm(total_mercury ~ fisherman, data = fishdata)

# fit the multiple predictor model with fisherman, weight, fishmlwk
fit_multiple <-
  lm(total_mercury ~ fisherman + weight + fishmlwk, data = fishdata)

# let's look at the output
summary(fit_univariate)
summary(fit_multiple)
