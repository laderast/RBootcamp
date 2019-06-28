library(dplyr)
library(gapminder)
library(ggplot2)
gap1992 <- gapminder %>% filter(year == 1992)
##run head on gap1992
head(gap1992)
##run colnames here on gap1992
colnames(gap1992)
##run nrow() on gap1992
nrow(gap1992)
