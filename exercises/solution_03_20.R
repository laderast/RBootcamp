library(fivethirtyeight)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
options(tibble.width = Inf)
race_country_box_office <- biopics %>%
    filter(!is.na(box_office)) %>%
    group_by(race_known, country) %>%
    summarize(mean_box_office=mean(box_office)) %>%
    arrange(desc(mean_box_office))
