library(fivethirtyeight)
library(ggplot2)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
options(tibble.width = Inf)
bPlot <- biopics %>% filter(year_release < 1990) %>% filter(!is.na(box_office)) %>%
    ggplot(aes(x=year_release, y=log(box_office), color=person_of_color)) +
    geom_point()
    
print(bPlot)
