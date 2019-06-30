library(ggplot2)
pets <- readRDS("data/pets.rds")

##show a barplot and count by name and fill by animal
##theme() allows us to angle the text labels so that we can read them
ggplot(pets, aes(x=name)) + geom_bar() + 
    ##we make the x axis text angled 
    ##for better legibility
    theme(axis.text.x = element_text(angle=45))

