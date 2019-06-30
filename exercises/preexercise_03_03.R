library(fivethirtyeight)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)