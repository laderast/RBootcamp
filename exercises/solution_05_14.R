library(readr)
library(dplyr)
library(ggplot2)
library(broom)

fishdata <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/fisherman_mercury_modified.csv")
fishdata$fisherman <- factor(fishdata$fisherman)
# Here are our models again
fit_univariate <- lm(total_mercury~fisherman,data=fishdata)
fit_multiple <- lm(total_mercury~fisherman+weight+fishmlwk,data=fishdata)

# save augmented data here
fit_multiple_augment <- augment(fit_multiple)
fit_univariate_augment <- augment(fit_univariate)

# bind rows
augmented_data <- bind_rows("univariate"=fit_univariate_augment,
                            "multiple"=fit_multiple_augment,.id="model")

ggplot(augmented_data,aes(x=total_mercury,y=.fitted,color=fishmlwk,shape=fisherman))+
    geom_point()+
    geom_abline(intercept=0,slope=1)+
    facet_wrap(~model)
