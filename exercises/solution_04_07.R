load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/module4.RData"))
MouseBalanceTimeSeries <- data.frame(MouseBalanceTimeSeries)
MouseBalanceTimeSeries <- data.frame(mouseID=rownames(MouseBalanceTimeSeries), MouseBalanceTimeSeries)
colnames(MouseBalanceTimeSeries)[3] <- "PreTreat2"
library(tidyr)
library(dplyr)
library(ggplot2)

gatheredMouse <- MouseBalanceTimeSeries %>% gather(key=measurementStatus, value=time, -mouseID) %>%
    filter(!is.na(time)) %>% separate(measurementStatus, c("intervention","replicate"), sep="Treat")

ggplot(gatheredMouse, aes(x=intervention, y=time)) + geom_boxplot()
