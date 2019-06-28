library(fivethirtyeight)
library(dplyr)

data(biopics)
options(tibble.width = Inf)
biopics_sorted <- biopics %>% arrange(year_release, lead_actor_actress)
