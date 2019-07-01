library(dplyr)
biopics <- readRDS("data/biopics.rds")

biopics$country <- factor(biopics$country)
##run summary here
summary(biopics)
##show length of country categories here
length(levels(biopics$country))
