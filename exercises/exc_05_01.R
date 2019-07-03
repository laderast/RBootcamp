library(dplyr)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# Glimpse the fisherman data
glimpse(___)

# Create a table of fisherman status
fishdata %>% select(___) %>% table()

# Create a table of fisherman status by fish parts
fishdata %>% select(___,___) %>% table()


