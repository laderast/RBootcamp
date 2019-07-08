library(tidyverse)
library(broom)

fishdata <- read_csv("data/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
glimpse(fishdata)

fishdata %>% select(___) %>% table()

fishdata %>% select(___,___) %>% table()
