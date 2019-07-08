library(dplyr)
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# here is our model
fit_multiple <-
  lm(total_mercury ~ fisherman + weight + fishmlwk, data = fishdata)

# ok where is that R^2? look at the names of the summary list again
names(summary(fit_multiple))

# call the name we need
summary(fit_multiple)$r.squared

# or we can use glance
glance(fit_multiple)

# and select that R^2
glance(fit_multiple) %>% select(r.squared)
