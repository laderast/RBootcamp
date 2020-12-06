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

After this chapter, you will be able to handle about 90% of your data visualization, data manipulation, and data cleaning problems. Hopefully you'll have gained enough confidence to start going beyond this Bootcamp and learn some more.

Just move on to the next exercise. 

</exercise>

<exercise id="2" title="What is Tidy Data?">

Tidy data is defined as data that has the following properties:

- each row corresponds to an observation
- each variable is a column
- each type of observation is in a different table

<img src = "tidy-1.png">

One thing to keep in mind is when columns are not separate variables. One clue is that the column names could be considered categories of a single variable. This means that the columns themselves could each correspond to a single observation.

Look at the `dem_score` dataset in the console by using either `head()` or `summary()` Would you consider this dataset tidy?

<codeblock id="04_02">
</codeblock>

<choice>
<opt text="Yes, we consider each row to be a separate observation">
Not quite - look at the columns - is a row considered a single observation, or many over time?</opt>
<opt text="No, each column is not a separate observation, but actually multiple observations" correct="true">
Good eye! Yes, each row and year/column should be considered as separate observations.
</opt>
</choice>
</exercise>

<exercise id="3" title="tidyr::pivot_longer()">

`pivot_longer()` is a special function in the `tidyr` package that takes columns and combines them into a single column. 
`pivot_longer()` takes the following arguments:

- `cols` - the columns to collapse. Here we want to collapse everything into a single column *except* the `country` variable, hence, `-country` as our argument.

We haven't talked about `tidyselect` verbs, but there are a few that let you select columns based on naming criteria. (For more info about `tidyselect`, you can go here: https://tladeras.shinyapps.io/learning_tidyselect)

- `names_to` - the name of the column where the labels will be consolidated to

- `values_to` - the name of the column where the values in the columns in the wide data will be consolidated to.


```
dem_score %>% 
    pivot_wider(cols = -country,
                names_to = "year",
                values_to = "score")
```

### Instructions

+ Try out the above `pivot_wider` statement. 
+ Use a `mutate` expression to remove the `X` in front of `year`.  
+ Assign the output to `gatheredData`.

<codeblock id="04_03">
</codeblock>
</exercise>


<exercise id="4" title="tidyr::pivot_wider()">

`pivot_wider()` does the opposite of `pivot_longer()`. It "unbundles" a column into multiple columns.

This situation can happen because related measurements that consist of an observation are collected separately, or someone has `gather`ed the data a little too enthusiastically.

`pivot_wider()` has the following arguments:

- `names_from` - the column that has the names you want to make wider - these will be made into column names.
- `values_from` - the column that has the values you want to make wider - these will be the actual values that are underneath the column names.


```{r}
spreadData <- gatheredData %>% 
  pivot_wider(names_from = "year",
              values_from = "score")
```

### Instructions

+ Let's transform our `gatheredData` into a matrix again, but with each column having a `country`. (Hint: you'll need to use `country` as an argument)
+ Assign the output to `spreadData`.

<codeblock id="04_04">
</codeblock>
</exercise>

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
Here we specify the variable name with `col`, the names of the new columns with `into`, and the delimiter, or separator in the variable to separate on, with `sep`. Note that `sep` can
be any string.

### Instructions

+ `separate` `HealthCodeEncounterCode` into `HealthCode` and `EncounterCode` for  `health_code_example`, assigning the output to `health_code_separated`. Here is an excerpt of the first few rows of `health_code_separated`.:

```
# A tibble: 5 x 3
  PatientID HealthCodeEncounterCode timeElapsed
  <chr>     <chr>                         <dbl>
1 P1        410/22                           20
2 P2        410/20                           15
3 P3        511/22                           16
4 P4        511/20                           17
5 P5        511/20                           30
```

+ Show those patients that had `HealthCode==410`, assigning them to `patients410`. 
+ Show the `head()` of `patients410`.

<codeblock id="04_05">
</codeblock>
</exercise>

<exercise id="6" title="Wide Versus Long Data">

In addition to tidy data, we can have long data versus wide data. We call a dataset as *long data*
because the format of the data has many more rows than columns, and we call data *wide data*, 
because it has more columns than rows. You have seen how to transform a *wide* dataset (`dem_score`) 
into a *long* one with `gather()` and transform it into a different *wide* format with (`spread`).

In general, I tend to work with long data because this format makes it easier to aggregate the data for 
plots when I have a lot of covariates. Let's look at what's possible because the data is in a long format.

Let's practice with another dataset in long format, called `fertilityTidy`. You can look at the 
original data as `fertilityData`. We'll summarize it in two different ways.

### Instructions

+ Look at `fertilityTidy`. Show the average fertility by country to present day by using `dplyr` verbs, calling this variable `meanCountryRate`. Here are the first few rows of `fertilityTidy`:

```
              Country Year fertilityRate
1         Afghanistan 1800          7.00
2             Albania 1800          4.60
3             Algeria 1800          6.99
4              Angola 1800          6.93
5 Antigua and Barbuda 1800          5.00
6           Argentina 1800          6.80
```

+ Assign the summarized data to `fertilityMeanByCountry`. 
+ Show `fertilityMeanByCountry`.
+ Next, show average fertility by `Year`, using `group_by/summarize()` assigning the
summarized data to `fertilityMeanByYear`. 
+ Show `fertilityMeanByYear`.

<codeblock id="04_06">
You'll have to first use a `filter()` statement, and then a `group_by/summarize` statement.</codeblock></exercise>

<exercise id="7" title="Putting  dplyr, tidyr, and ggplot2 all together">

Let's put everything we've learned together on a new data.frame called `MouseBalanceTimeSeries`.

### Instructions

+ Look at the `MouseBalanceTimeSeries` `data.frame`. This is a wide `data.frame` where each column corresponds to the time (in seconds) a mouse stayed on a balance beam pre and post treatment. Here are the first few rows of the dataset:

```
mouseID PreTreat1 PreTreat2 PreTreat3 PostTreat1 PostTreat2 PostTreat3
1      M1       2.1       1.9       1.6        4.4        3.5        5.1
2      M2       1.8       2.6       1.7        5.2        4.9        4.2
3      M3       1.9       1.1       1.8        2.1        2.2        1.8
4      M4       2.4       0.8       2.2        3.1        3.3        3.4
5      M5        NA        NA        NA         NA         NA         NA
6      M6       4.5       4.3       3.8        3.7        4.2        5.6
```
+ `gather()` the measurements into a single column called `time` with a key called `measurementStatus`. 
+ Use `separate()` to make `measurementStatus` into  two columns (`intervention` and `replicate`) by specifying `sep="Treat"`. 
+ Remove any observations that are `NA`. Assign the output to `gatheredMouse`. 
+ Finally, make a boxplot of `gatheredMouse`, plotting `time` versus `intervention` using `geom_boxplot`.

<codeblock id="04_07">
</codeblock></exercise>

<exercise id="8" title="Was there a difference?">

Was there a difference in mean time spent on the balance beam pre and post treatment?

<img src="mouse_time.png">

<choice>
<opt text="No, the times were too close to tell.">
Go back and look at the graph.
</opt>
<opt text="Yes, the intervals overlapped, but the means were clearly different" correct="true">
Yes, there is a difference in medians, although the intervals overlapped.</opt>
</choice>
</exercise>


</codeblock></exercise>

<exercise id="9" title="What you learned in this lesson">

+ How to identify tidy data
+ How to make messy data tidy using `tidyr`
+ Long vs. Wide data
+ The tidy manifesto

**More Resources**

- The [Tidy Data](https://r4ds.had.co.nz/tidy-data.html) Chapter of R for Data Science is ground zero for understanding why Tidy data is such a useful format.
- The sections on [Spreading and Gathering](https://r4ds.had.co.nz/tidy-data.html#spreading-and-gathering) and [Separating and uniting](https://r4ds.had.co.nz/tidy-data.html#separating-and-uniting) are especially helpful.

</exercise>
