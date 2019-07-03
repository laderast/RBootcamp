library(tidyverse)
library(broom)

fishdata <- read_csv("data/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
fishTtest <- t.test(total_mercury~fisherman,data=fishdata)

# use tidy here
tidyTtest <- tidy(fishTtest)

# glimpse your output
glimpse(tidyTtest)

# extract a p-value
tidyTtest$p.value
