library(ggplot2)
gap1992 <- read.csv("data/gap1992.csv")

ggplot(gap1992, aes(x = log(gdpPercap), y = lifeExp, size=pop, color=continent)) +
  geom_point() + ggtitle("Gapminder for 1992")
ggsave("static/gap1992.png", width = 5, height = 3)