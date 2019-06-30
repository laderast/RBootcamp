ggplot(pets, aes(x=animal,fill=shotsCurrent)) + 
  geom_bar(position= "dodge", color="black")