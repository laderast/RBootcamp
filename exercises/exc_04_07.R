library(tidyr)
library(dplyr)
library(ggplot2)
MouseBalanceTimeSeries <- read.csv("data/mouse.csv")

gatheredMouse <- MouseBalanceTimeSeries %>% 
  gather(-----) %>%
  filter(!is.na(time)) %>% 
  separate(-----)

ggplot(gatheredMouse, aes(x=intervention, y=time)) + geom_boxplot()
