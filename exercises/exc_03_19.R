library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics_by_country <- biopics %>%
  filter(year_release ----- & year_release -----) %>%
  filter(!is.na(box_office)) %>%
  mutate(box_office_per_subject = ------)

summary(biopics_by_country)
