library(readr)
library(dplyr)
library(ggplot2)
library(broom)

fishdata <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
# Here are our two models
fit_univariate <- lm(total_mercury~fisherman,data=fishdata)
fit_multiple <- lm(total_mercury~fisherman+weight+fishmlwk,data=fishdata)

# Tidy 'em up
fit_univariate_tidy <- 
fit_multiple_tidy <- 

# Bind them
both_tidy <- bind_rows( "univariate"=___,
                        "multiple"=___,
                        .id="model")
both_tidy

# Same with glance (we can try doing this in one line)
both_glance <- bind_rows(   "univariate"=glance(___),
                            "multiple"=glance(___),
                            .id="model")
both_glance

# Show just fisherman's covariate information
both_tidy%>%___(term=="fisherman1")
