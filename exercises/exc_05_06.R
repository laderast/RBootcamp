library(dplyr)
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

fishTtest <- t.test(total_mercury~fisherman,data=fishdata)

# use tidy here
tidyTtest <- tidy()

# glimpse your output
glimpse(___)

# extract a p-value
tidyTtest$___

