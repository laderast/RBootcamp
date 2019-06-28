ggplot(pets, aes(x=name)) + geom_bar() + 
  facet_wrap(facets=~shotsCurrent, scale=    ) +
  theme(axis.text.x = element_text(angle=45))