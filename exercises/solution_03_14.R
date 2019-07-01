library(dplyr)
biopics <- readRDS("data/biopics.rds")

gender_box_office <- biopics %>% 
    filter(!is.na(box_office)) %>%
    group_by(subject_sex) %>% 
    summarize(mean_bo_by_gender=mean(box_office))

##show head of gender_box_office
head(gender_box_office)
