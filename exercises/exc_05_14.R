# Here are our models again
fit_univariate <- lm(total_mercury~fisherman,data=fishdata)
fit_multiple <- lm(total_mercury~fisherman+weight+fishmlwk,data=fishdata)

# save augmented data here
fit_multiple_augment <- 
fit_univariate_augment <- 

# bind rows
augmented_data <- bind_rows("univariate"=,
                            "multiple"=,
                            .id="model")

# scatterplot of total mercury (x-axis) vs fitted values (y-axis), color fishmlwk and shape fisherman
ggplot(augmented_data,aes())+
    geom_point()+
    geom_abline()+
    facet_wrap()