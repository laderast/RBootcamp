library(dplyr)
biopics <- readRDS("data/biopics.rds")

data(biopics)
biopics$country <- factor(biopics$country)
##run summary here

##show length of country categories here

