library(tidyr)
library(dplyr)
library(readr)
health_code_example <- 
    read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/healthExample.csv")
health_code_separated <- 
    health_code_example %>% 
        separate(col=HealthCodeEncounterCode, 
        into=c("HealthCode", "EncounterCode"), 
        sep="/")
        
patients410 <- health_code_separated %>% filter(HealthCode==410)

patients410
