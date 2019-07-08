library(dplyr)
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# Here are our two models
fit_univariate <- lm(total_mercury ~ fisherman, data = fishdata)
fit_multiple <-
  lm(total_mercury ~ fisherman + weight + fishmlwk, data = fishdata)

# Tidy 'em up
fit_univariate_tidy <- ____
  
fit_multiple_tidy <- ____
  
# Bind them
both_tidy <- bind_rows("univariate" = ___,
                         "multiple" = ___,
                         .id = "model")
both_tidy

# Same with glance (we can try doing this in one line)
both_glance <- bind_rows(
  "univariate" = glance(___),
  "multiple" = glance(___),
  .id = "model"
)
both_glance

# Show just fisherman's covariate information
both_tidy %>% ___(term == ___)
