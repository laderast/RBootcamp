load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/module4.RData"))

load("data/module4.RData")
MouseBalanceTimeSeries <- data.frame(MouseBalanceTimeSeries)
MouseBalanceTimeSeries <- data.frame(mouseID=rownames(MouseBalanceTimeSeries), MouseBalanceTimeSeries)
colnames(MouseBalanceTimeSeries)[3] <- "PreTreat2"

write.csv(MouseBalanceTimeSeries, "data/mouse.csv")