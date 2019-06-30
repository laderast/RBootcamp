library(fivethirtyeight)
library(dplyr)

data(biopics)
options(tibble.width = Inf)
threeVarTable <- biopics %>% select(movieTitle=title, box_office, subject_sex)
