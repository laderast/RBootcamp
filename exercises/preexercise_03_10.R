library(fivethirtyeight)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
options(tibble.width = Inf)