library(tidyr)
library(dplyr)
library(readr)
health_code_example <- 
  read_csv("data/healthExample.csv")

health_code_separated <- 
  health_code_example %>%
  separate(col = -----, 
           into = c(----,----), 
           sep = ----)
        
patients410 <- health_code_separated %>% 
  filter(HealthCode == ----)

patients410
