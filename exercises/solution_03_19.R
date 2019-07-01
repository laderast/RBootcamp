library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics_by_country <- biopics %>%
  filter(year_release <= 2014 & year_release >= 2000) %>%
  filter(!is.na(box_office)) %>%
  mutate(box_office_per_subject = box_office / number_of_subjects)

summary(biopics_by_country)
