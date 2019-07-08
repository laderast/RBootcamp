library(dplyr)
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

fishTtest <- t.test(total_mercury~fisherman,data=fishdata)

# use tidy here
tidyTtest <- tidy(fishTtest)

# glimpse your output
glimpse(tidyTtest)

# extract a p-value
tidyTtest$p.value
