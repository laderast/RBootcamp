library(tidyverse)
library(broom)

fishdata <- read_csv("data/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
glimpse(fishdata)

fishdata %>% select(fisherman) %>% table()

fishdata %>% select(fisherman,fishpart) %>% table()
