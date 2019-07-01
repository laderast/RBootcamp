library(dplyr)
biopics <- readRDS("data/biopics.rds")

gender_box_office <- biopics %>% 
    filter() %>%
    group_by() %>% 
    summarize(mean_bo_by_gender=)
    
##show head of gender_box_office
head(gender_box_office)
