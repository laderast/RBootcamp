library(fivethirtyeight)
library(ggplot2)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
options(tibble.width = Inf)