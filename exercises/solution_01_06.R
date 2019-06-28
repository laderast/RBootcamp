ggplot(gap1992, aes(x = log(gdpPercap), y = lifeExp, color=continent)) +
## add code here
  geom_line() + geom_point()