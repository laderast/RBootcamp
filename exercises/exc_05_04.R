library(tidyverse)
library(broom)

fishdata <- read_csv("data/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
fishdata %>%
    group_by() %>%
    summarize(  mean_total_mercury = , 
                sd_total_mercury = )
