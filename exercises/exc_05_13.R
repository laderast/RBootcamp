library(dplyr)
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# Here are our models again
fit_univariate <- lm(total_mercury~fisherman,data=fishdata)
fit_multiple <- lm(total_mercury~fisherman+weight+fishmlwk,data=fishdata)

# save augmented data here
fit_multiple_augment <- ____
fit_univariate_augment <- ____

# bind rows
augmented_data <- bind_rows("univariate" = ____,
                              "multiple" = ____,
                              .id = "model")

# scatterplot of total mercury (x-axis) vs fitted values (y-axis), color fishmlwk and shape fisherman
ggplot(augmented_data, aes(____)) +
  geom_point() +
  geom_abline(____, ____) +
  facet_wrap(~____)
