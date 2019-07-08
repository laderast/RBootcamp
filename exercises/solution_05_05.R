library(dplyr)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# Run a t-test comparing mean total mercury in fishermen and non-fishermen
# Hint: Use the formula input option, see ?t.test help page
t.test(total_mercury~fisherman,data=fishdata)
