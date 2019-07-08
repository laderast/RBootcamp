---
title: 'Chapter 5: Simple Stats and Modeling with broom' 
description: Now we have tidy data, let's start doing some statistics!
prev: /chapter4
next: /chapter6
id: 5
type: chapter
---

</codeblock></exercise>

<exercise id="1" title="Let's explore the fishermen mercury dataset">

We are going to explore a dataset called the fishermen mercury dataset, which consists of factors 
related to mercury exposure among two groups: fishermen and non-fishermen, who are our control group. 

Take a look at the readme for this dataset first: [README](fishermen_mercury_README.md)

Then use `glimpse` to take a look at the structure of the data and try `table()` on 
`fisherman`. What are the different categories of `fishpart` and `fisherman`?

Now use `table()` as part of a pipe to look at the cross-table of `fisherman` and `fishpart`. Are fishermen more likely to eat more whole fish than non-fishermen?


`glimpse()` the data, create a table for `fisherman` and a crosstable of `fisherman`x`fishpart`.



<codeblock id="05_01">
</codeblock></exercise>

<exercise id="2" title="Visualize Mean of Total Mercury by Fisherman Status">

Let's visualize mean `total_mercury` (total mercury) by `fisherman` status to 
see whether there is a difference between them.


Use `geom_boxplot()` to visualize the median of `total_mercury` conditioned on
`fisherman` status. Make sure to cast `fisherman` as a factor.

We can add the mean as a point using `stat_summary` to see how the mean differs from the median.



<codeblock id="05_02">
</codeblock></exercise>

<exercise id="3" title="Compute Means with group_by">

We can also use `group_by` and `summarize` to explicitly compute the means and standard deviations for each `fisherman` group.


Use `group_by` in the `dplyr` package to group the data frame by `fisherman` status, and use `summarize` to obtain the mean and standard deviation of `total_mercury` for each group. 



<codeblock id="05_03">
</codeblock></exercise>

<exercise id="4" title="Is there a difference?">

Is there a difference between the two groups: fishermen and non-fishermen?

<choice>
<opt text="No, there isn't. The means are too close.">
Look closer.
</opt>
<opt text="Yes, there is. The intervals overlap but there is a clear difference in means"  correct = "true">
Correct! That's right, fisherman seem to have higher total mercury
</opt>
</choice>
</exercise>

<exercise id="5" title="T-test of means for fisherman status">

A common and very useful test used to compare two means for Normally distributed data is the Student's T Test. The null hypothesis is that two means from two independent groups are identical, and the alternative hypothesis is that the two means are not identical (two-sided test).

In our case, we want to test whether the mean total mercury in fishermen is the same or different than the mean total mercurcy for non-fishermen. What is the p-value from this test?


Use the function `t.test` to compare the mean `total_mercury` in fishermen and nonfishermen.



<codeblock id="05_05">
</codeblock></exercise>

<exercise id="6" title="Sweep up that output with Broom">

That output was pretty ugly, wasn't it? There's an extremely handy package called `broom` that can help us clean it up into a tidy data table. Funnily enough, the handy function is called `tidy`.


Use `tidy()` to save the output of the t.test to a data.frame called `tidyTtest`. Then `glimpse()` it to see what's in there, and lastly explore how you can easily extract results (like the p-value) in the usual data.frame way.



<codeblock id="05_06">
</codeblock></exercise>

<exercise id="7" title="Let's delve deeper into the data">

We have other covariates in our data. We want to see whether we can use these covariates to
predict the level of Mercury Exposure. Could another covariate be confounding the relationship between fisherman and total mercury?

Let's first look at the scatter plots of `weight` and number of fish meals per week `fishmlwk` vs `total_mercury`. Do there seem to be any associations?


Use `geom_point` to make scatterplots of the two variables.



<codeblock id="05_07">
</codeblock></exercise>

<exercise id="8" title="Linear Regression">

It looks like both `weight` and number of fish meals per week (`fishmlweek`) are associated with `total_mercury`. They also appear to be associated with `fisherman` status. We saw earlier from our cross-table output that fisherman tend to eat more fish (surprised?).

We can use linear regression to adjust for these possible confounders. We first build a univariate linear regression with just `fisherman` as a predictor of `total_mercury`. Then we compare it to a multiple linear regression with the three independent variables.

Note: the p-value from the linear regression is similar but not exactly the same as the t-test since the t-test assumed equal variances between groups (argument `var.equal=TRUE` by default in `t.test()`).


Fit a linear regression with `fisherman` as the independent variable and `total_mercury` as the dependent variable. Save this as `fit_univariate`. Then, fit a multiple linear regression with `fisherman`, `weight`, `fishmlwk` as dependent variables. Save this as `fit_multiple`.



<codeblock id="05_08">
</codeblock></exercise>

<exercise id="9" title="Interpreting coefficients">

What does the coefficient (column "Estimate"") of fish meals per week in the multiple regression output mean?

<choice>
<opt text="For every fish meal you eat, you are 1.02 times more likely to have higher mercury.">
No, the effect is not multiplicative.
</opt>
<opt text="Each additional fish meal per week is expected to increase mercury levels by 0.106mg/g, when comparing people with the same weight and comparing people who are either both fisherman or both non-fisherman."  correct = "true">
Correct! That's right, adjusting for weight and fisherman status, fish meals per week is modeled as an additive effect.
</opt>
<opt text="Fisherman who eat one more fish meal per week are expected to have higher mercury levels of 0.106mg/g."
Not quite, this expected increase applies for fisherman as well as non-fisherman.
</choice>
</exercise>

<exercise id="10" title="Broom with linear regression: glance">

Now let's do something similar with the $R^2 $ summary measure which is a measure of model fit in that it quantifies the amount of variance explained in the outcome (total mercury) explained by the predictors. Using broom, we get model summary level information from the function `glance()`. While `tidy()` returned a tibble/data_frame of covariate information with one row for each model term, `glance()` will return a tibble with just one row with all the pertinent single value model information.


Use the output from `summary` to obtain an $R^2 $ for fisherman from `fit_multiple`. Then, use `broom::glance`.



<codeblock id="05_10">
</codeblock></exercise>

<exercise id="11" title="Compare our models">

We've built two models: `fit_univariate` and `fit_multiple`. The first only contains `fisherman` as a predictor, and the second contains `fisherman` as well as `weight` and number of `fishmealwk`.

Which model fits the data better, and how does the association of fisherman with total mercury change when we adjust for weight and number of fish meals per week? Are the other covariates significantly associated with total mercury?


Extract the covariate information using `tidy` from the two models and bind them together into one data frame with `bind_rows` in the dplyr package. Do the same with the model summary information using `glance`. Then, use a dplyr function to look at just the fisherman covariate results from both models.



<codeblock id="05_11">
</codeblock></exercise>

<exercise id="12" title="Prediction of mercury">

How confident are you that being a fisherman is associated with higher levels of mercury?

<choice>
<opt text="So confident, I don't want to be a fisherman!">
Are you sure?</opt>
<opt text="Not confident, there are other confounding factors at play here, maybe they should just eat less fish?" correct = "true">
That's right, total fish intake seems to be more associated with mercury levels, and after adjusting for this in the multiple regression, fisherman status is no longer significantly associated with total mercury.
</opt>
</choice>
</exercise>

<exercise id="13" title="Challenge 1: augment + ggplot2">

We have some models and with models comes predictions, or fitted values. That is, we've fit a linear regression to predict our "y" which is `total_mercury`, and we can obtain fitted values based on the model. We can compare these fitted values to the true value of `total_mercury`.

The broom function `augment` will give us our fitted values. Plot these fitted values against the true values of `total_mercury` using ggplot.

For a reference while you work, you can use the `ggplot2` cheatsheet here:
[ggplot2 cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)

For both models, use `augment` to obtain fitted values of `total_mercury` and save these to new data frames `fit_univariate_augment` and `fit_multiple_augment`. Use `bind_rows` to bind these data frames into one long tidy data frame. Then use `ggplot2` to make a scatterplot of fitted values and true values of `total_mercury`, colored by `fishmlwk` and let shape correspond to `fisherman`. Use `facet_wrap` to look at both models side by side. Add a diagonal line for good measure, so we can see how close the fitted values correlate.



<codeblock id="05_13">
</codeblock></exercise>


