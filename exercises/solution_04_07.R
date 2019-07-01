library(tidyr)
library(dplyr)
library(ggplot2)
MouseBalanceTimeSeries <- read.csv("data/mouse.csv")

gatheredMouse <- MouseBalanceTimeSeries %>% 
  gather(key=measurementStatus, value=time, -mouseID) %>%
  filter(!is.na(time)) %>% 
  separate(measurementStatus, 
           c("intervention","replicate"), 
           sep="Treat")

ggplot(gatheredMouse, aes(x=intervention, y=time)) + geom_boxplot()
