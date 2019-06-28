ggplot(pets, aes(x=animal,fill=shotsCurrent)) + 
  geom_bar(position= "fill", color="black")