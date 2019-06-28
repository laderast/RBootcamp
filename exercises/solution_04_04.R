spreadData <- gatheredData %>% spread(key=country, value=score)
head(spreadData)