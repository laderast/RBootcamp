library(dplyr)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# Glimpse the data
glimpse(fishdata)

# Create a table of fisherman status
fishdata %>% select(fisherman) %>% table()

# Create a table of fisherman status by fish parts
fishdata %>% select(fisherman,fishpart) %>% table()


