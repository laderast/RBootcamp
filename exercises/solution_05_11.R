library(dplyr)
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# Here are our two models
fit_univariate <- lm(total_mercury ~ fisherman, data = fishdata)
fit_multiple <-
  lm(total_mercury ~ fisherman + weight + fishmlwk, data = fishdata)

# Tidy 'em up
fit_univariate_tidy <- tidy(fit_univariate)

fit_multiple_tidy <- tidy(fit_multiple)

# Bind them
both_tidy <- bind_rows("univariate" = fit_univariate_tidy,
                       "multiple" = fit_multiple_tidy,
                       .id = "model")
both_tidy

# Same with glance
both_glance <- bind_rows(
  "univariate" = glance(fit_univariate),
  "multiple" = glance(fit_multiple),
  .id = "model"
)
both_glance

# Show just fisherman's covariate information
both_tidy %>% filter(term == "fisherman1")
