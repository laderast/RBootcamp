library(ggplot2)
gap1992 <- read.csv("data/gap1992.csv")

ggplot(gap1992, aes(x = log(gdpPercap), y = lifeExp, color=continent)) +
  geom_line() 
