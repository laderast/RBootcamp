---
title: 'Chapter 4: The Whys and Hows of Tidy Data' 
description: Why we need tidy data and using `tidyr` to make messy data tidy
prev: /chapter3
next: /chapter5
id: 4
type: chapter
---
<exercise id="1" title="What you'll learn in this Chapter:">

+ How to identify tidy data
+ How to make messy data tidy using `tidyr`
+ Long vs. Wide data
+ The tidy manifesto
+ Loading Data
+ Joining tables on a common identifier

After this chapter, you will be able to handle about 90% of your data visualization, data manipulation, and data cleaning problems. Hopefully you'll have gained enough confidence to start going beyond this Bootcamp and learn some more.

Just move on to the next exercise. (CTRL+K)



<codeblock id="04_01">
</codeblock></exercise>

<exercise id="2" title="What is Tidy Data?">

Tidy data is defined as data that has the following properties:

- each row corresponds to an observation
- each variable is a column
- each type of observation is in a different table

![Tidy Data](http://s3.amazonaws.com/assets.datacamp.com/production/course_3864/datasets/tidy-1.png)

One thing to keep in mind is when columns are not separate variables. One clue is that the column names could be considered categories of a single variable. This means that the columns themselves could each correspond to a single observation.

Look at the `dem_score` dataset in the console by using either `head()` or `summary()` Would you consider this dataset tidy?

<choice>
<opt text="Yes, we consider each row to be a separate observation">
NA</opt>
<opt text="No, each column is not a separate observation, but actually multiple observations">
NA</opt></choice>
</exercise>

<exercise id="3" title="tidyr::gather()">

`gather()` is a special function in the `tidyr` package that takes columns and combines them into a single column. 
`gather()` has the following syntax:

```{r}
dem_score %>% gather(key=year, value=score, -country)
```
The first argument, `key`, is the name of our 'gathered' variable. We're smushing all of the columns that have year names and 
calling the column names, or the `key` the name of `year`. The second argument, `value`, is the actual observations. Finally, if we don't want a column to be gathered, we can leave it out with the `-` notation (here, `-country`).


+ Try out the above `gather` statement. 
+ Use a `mutate` expression to remove the `X` in front of `year`. (Look up the documentation for `str_replace` to see how to remove the `X` in the mutate statement). 
+ Assign the output to `gatheredData`.



<codeblock id="04_03">
The `mutate` expression to remove the `X` is `mutate(year=str_replace(year, "X", "")`.</codeblock></exercise>

<exercise id="4" title="tidyr::spread()">

`spread()` does the opposite of `gather()`. It "unbundles" a column into multiple columns.
This situation can happen because related measurements that consist of an observation are
collected separately, or someone has `gather`ed the data a little too enthusiastically.

`spread()` has the following syntax:

```{r}
gatheredData %>% spread(key=country, value=score)
```
We see that `spread()` takes two arguments: the first is the *key* column, which is the 
variable name that contains our column names of interest; the second is the *value* 
column, which is the variable that contains the values we want to fill with.


+ Let's transform our `gatheredData` into a matrix again, but with each column having a 
`country`. 
+ Assign the output to `spreadData`.



<codeblock id="04_04">
</codeblock></exercise>

<exercise id="5" title="dplyr::separate()">

Have you ever had a table which had a column that actually consisted of bunch of other columns together,
separated by something? Something like this?

```{r}
"value1/value2/value3"
```
`separate()` is made to make this one variable into many other variable. Separate takes the following arguments:

```{r}
health_code_separated <- 
    health_code_example %>% 
        separate(col=HealthCodeEncounterCode, 
        into=c("HealthCode", "EncounterCode"), sep="/")
```
Here we specify the variable name with `col`, the names of the new columns with `into`, and 
the delimiter, or separator in the variable to separate on, with `sep`. Note that `sep` can
be any string.


+ Run the above code and `separate` `HealthCodeEncounterCode` into `HealthCode` and `EncounterCode` for  `health_code_example`, assigning the output to `health_code_separated`. 
+ Show those patients that had `HealthCode==410`, assigning them to `patients410`. 
+ Show `patients410`.



<codeblock id="04_05">
</codeblock></exercise>

<exercise id="6" title="Wide Versus Long Data">

In addition to tidy data, we can have long data versus wide data. We call a dataset as *long data*
because the format of the data has many more rows than columns, and we call data *wide data*, 
because it has more columns than rows. You have seen how to transform a *wide* dataset (`dem_score`) 
into a *long* one with `gather()` and transform it into a different *wide* format with (`spread`).

In general, I tend to work with long data because this format makes it easeir to aggregate the data for 
plots when I have a lot of covariates. Let's look at what's possible because the data is in a long format.

Let's practice with another dataset in long format, called `fertilityTidy`. You can look at the 
original data as `fertilityData`. We'll summarize it in two different ways.


+ Look at `fertilityTidy`. Show the average fertility by country to present day 
by using `dplyr` verbs, calling this variable `meanCountryRate`. 
+ Assign the summarized data to `fertilityMeanByCountry`. 
+ Show `fertilityMeanByCountry`.
+ Next, show average fertility by `Year`, using `group_by/summarize()` assigning the
summarized data to `fertilityMeanByYear`. 
+ Show `fertilityMeanByYear`.



<codeblock id="04_06">
You'll have to first use a `filter()` statement, and then a `group_by/summarize` statement.</codeblock></exercise>

<exercise id="7" title="Putting  dplyr, tidyr, and ggplot2 all together">

Let's put everything we've learned together on a new data.frame called `MouseBalanceTimeSeries`.


+ Look at the `MouseBalanceTimeSeries` `data.frame`. This is a wide `data.frame` where 
each column corresponds to the time (in seconds) a mouse stayed on
a balance beam pre and post treatment. 
+ `gather()` the measurements into a single column called `time` with a key called `interventionStatus`. 
+ Use `separate()` to make `measurementStatus` into  two columns (`intervention` and `replicate`) by specifying `sep="Treat"`. 
+ Remove any observations that are `NA`. Assign the output to `gatheredMouse`. 
+ Finally, make a boxplot of `gatheredMouse`, plotting `time` versus `intervention` using `geom_boxplot`.



<codeblock id="04_07">
</codeblock></exercise>

<exercise id="8" title="Was there a difference?">

Was there a difference in mean time spent on the balance beam pre and post treatment?

<choice>
<opt text="No, the times were too close to tell.">
NA</opt>
<opt text="Yes, the intervals overlapped, but the means were clearly different">
NA</opt></choice>
</exercise>


</codeblock></exercise>

