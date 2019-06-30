library(fivethirtyeight)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
options(tibble.width = Inf)
mutatedBiopics <- mutate(biopics, box_office_year = year_release * box_office, box_office_subject = paste0(box_office_year, subject))
