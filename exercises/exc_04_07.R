library(tidyr)
library(dplyr)
library(ggplot2)
MouseBalanceTimeSeries <- read.csv("data/mouse.csv")

gatheredMouse <- MouseBalanceTimeSeries %>% 
  gather(-----) %>%
  filter(!is.na(time)) %>% 
  #we have to recast time as numeric here
  mutate(time = as.numeric(time)) %>%
  separate(-----)

ggplot(gatheredMouse, aes(x=intervention, y=time)) + geom_boxplot()
