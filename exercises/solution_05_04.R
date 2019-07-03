library(tidyverse)
library(broom)

fishdata <- read_csv("data/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
fishdata% >%
  group_by(fisherman) %>%
  summarize(mean_total_mercury = mean(total_mercury), 
            sd_total_mercury = sd(total_mercury))
