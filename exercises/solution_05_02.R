glimpse(fishdata)

fishdata %>% select(fisherman) %>% table()

fishdata %>% select(fisherman,fishpart) %>% table()