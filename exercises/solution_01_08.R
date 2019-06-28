
ggplot(gap1992, aes(x = log(gdpPercap), 
    y = lifeExp, 
    color = continent,
    size = pop
    )) + ggtitle("Gapminder for 1992") + 
    geom_point()
