library(dplyr)
biopics <- readRDS("data/biopics.rds")

race_country_box_office <- biopics %>%
    filter(!is.na(box_office)) %>%
    group_by(race_known, country) %>%
    summarize(mean_box_office=mean(box_office)) %>%
    arrange(desc(mean_box_office))

race_country_box_office