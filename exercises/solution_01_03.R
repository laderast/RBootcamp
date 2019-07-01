library(ggplot2)
gap1992 <- read.csv("data/gap1992.csv")

ggplot(data=gap1992, 
    mapping = aes(
      x = log(gdpPercap), 
      y = lifeExp 
      )) + 
geom_point()

