#Space for your answer here.
ggplot(pets, aes(x=ageCategory, fill=animal)) + geom_bar(position="fill") +
    facet_wrap(facets=~shotsCurrent, scale="free_x")