library(dplyr)
library(tidyr)
library(stringr)

gatheredData <- dem_score %>% gather(key=year, value=score, -country) %>%
        mutate(year=str_replace(year, "X",""))

head(gatheredData)