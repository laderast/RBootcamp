library(dplyr)
library(ggplot2)
biopics <- readRDS("data/biopics.rds")

bPlot <- biopics %>% 
  filter(year_release < 1990) %>% 
  filter(!is.na(box_office)) %>%
    ggplot(aes(x=year_release, y=log(box_office), 
               color=person_of_color)) +
    geom_point()
    
print(bPlot)
