library(dplyr)
library(gapminder)
library(ggplot2)
gap1992 <- gapminder %>% filter(year == 1992)
ggplot(gap1992, aes(x = log(gdpPercap), y = lifeExp, color=continent)) +
## add code here

