#plot total_mercury here
ggplot(fishdata,aes(x=___,y=___)) + geom_boxplot() +
  stat_summary(fun.y="mean",geom="point",pch=3,color="red")