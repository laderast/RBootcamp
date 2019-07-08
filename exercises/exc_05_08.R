library(dplyr)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# fit the univariate model
fit_univariate <- lm(~,data=fishdata)

# fit the multiple predictor model with fisherman, weight, fishmlwk
fit_multiple <- lm(~,data=fishdata)

# let's look at the output
summary(fit_univariate)
summary(fit_multiple)
