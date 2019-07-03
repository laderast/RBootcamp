library(dplyr)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# Calculate mean and sd of mercury by fisherman status
fishdata %>%
  group_by(fisherman) %>%
  summarize(mean_total_mercury = mean(total_mercury), 
            sd_total_mercury = sd(total_mercury))
