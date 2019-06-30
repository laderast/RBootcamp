library(fivethirtyeight)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
options(tibble.width = Inf)
filteredBiopics <- filter(biopics, !is.na(box_office))

#show number of rows in biopics
nrow(biopics)
#show number of rows in filteredBiopics
nrow(filteredBiopics)
