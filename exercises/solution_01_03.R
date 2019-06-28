ggplot(data=gap1992, 
    mapping = aes(
      x = log(gdpPercap), 
      y = lifeExp 
      )) + 
geom_point()
