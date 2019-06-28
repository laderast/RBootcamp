fit_univariate <- lm(total_mercury~fisherman,data=fishdata)
fit_multiple <- lm(total_mercury~fisherman+weight+fishmlwk,data=fishdata)

# let's look at the output
summary(fit_univariate)
summary(fit_multiple)