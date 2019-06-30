library(fivethirtyeight)
library(dplyr)

data(biopics)
biopics$country <- factor(biopics$country)
##run summary here
summary(biopics)
##length of country category here
length(levels(biopics$country))
