library(fivethirtyeight)
library(dplyr)

data(biopics)
options(tibble.width = Inf)
gender_box_office <- biopics %>% 
    filter() %>%
    group_by() %>% 
    summarize(mean_bo_by_gender=)
    
##show gender_box_office
head(gender_box_office)
