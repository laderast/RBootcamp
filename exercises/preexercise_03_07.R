library(fivethirtyeight)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
biopics$type_of_subject <- factor(biopics$type_of_subject)
options(tibble.width = Inf)