---
title: 'Chapter 3: Introduction to dplyr' 
description: Learn how to manipulate data into a ggplot2 friendly format
prev: /chapter2
next: /chapter4
id: 3
type: chapter
---
<exercise id="1" title="Introduction to dplyr">

We've been looking at datasets that fit the `ggplot2` paradigm nicely; however, most data we encounter 
is really messy (missing values), or is a completely different format. In this chapter, we'll look 
at one of the most powerful tools in the `tidyverse`: `dplyr`, which lets you manipulate data frames. 
There is a function/action for most of the annoying tasks you have to use in data cleaning, which
makes it super useful.

In particular, we're going to look at six fundamental verbs/actions in `dplyr`:

- `filter()`
- `mutate()`
- `group_by()`/`summarize()`
- `arrange()`
- `select()`

Along the way, we'll do some data manipulation challenges. You'll be a `dplyr` expert in no time!

You will want to keep this `dplyr` cheat sheet open in a separate window to remind you about the syntax:
[dplyr cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

Also, remember: if you need to know the variables in a `data.frame` called `biopics` you can always use 

```{r}
colnames(biopics)
```

If you want more information on a function such as `mutate()`, you can always ask for help:

```{r}
?mutate
```

Move on to the next exercise!

</exercise>

<exercise id="2" title="A Little Bit about assignment">

In order to do the following exercises, we need to learn a little bit about how to assign 
the output of a function to a variable.

For example, we can assign the output of the operation `1 + 2` to a variable called `sumOfTwoNumbers`
using the `<-` operator. This is called the `assignment` operator.

You can also use `=` to assign a value to a variable, but I find it makes my code a bit confusing, because
there is also `==`, which tests for equality.

```{r}
sumOfTwoNumbers <- 1 + 2
```
Once we have something assigned to a variable, we can use it in other expressions:

```{r}
sumOfThreeNumbers <- sumOfTwoNumbers + 3
```
This is the bare basics of assignment. We'll use it in the next exercises to evaluate the output
of our `dplyr` cleaning.

### Instructions

+ Assign `newValue` the value of `10`. 
+ Then use `newValue` to calculate the value of `multValue` by calculating `newValue * 5`. 
+ Show `multValue`.

<codeblock id="03_02">
</codeblock></exercise>


<exercise id="3" title="Let's look at some data and ways to manipulate it.">

We're going to use the `biopics` dataset in the `fivethirtyeight` package to do learn `dplyr`. This is a dataset of 761 different biopic movies. 

## Instructions

+ Run a `summary` on the `biopics` dataset. It's already loaded up for you. 
+ How many categories are in the `country` variable?

<codeblock id="03_03">
Use the `levels()` function to count the categories.</codeblock>
</exercise>

<exercise id="4" title="dplyr::filter()">

`filter()` is a very useful `dplyr` command. It allows you to subset a `data.frame` based on variable criteria.

For example, if we wanted to subset `biopics` to those movies that were made in the `UK` we'd use the following statement:

```{r}
#subset the data using filter
biopicsUK <- filter(biopics, country=="UK")
#confirm that we have subsetted correctly
biopicsUK
```

Three things to note here: 

+ The first argument to `filter()` is the dataset. We'll see another variation of this in a second.
+ For those who are used to accessing `data.frame` variables by `$`, notice we don't have to use `biopics$country`. Instead, we can just use the variable name `country`.
+ Our filter statement uses `==`. Remember that `==` is an equality test, and `=` is to assign something. (confusing the two will happen to you from time to time.)

###Instructions

+ Filter `biopics` so that it only shows `Criminal` movies (you'll have to use the `type_of_subject` variable in `biopics`. 
+ Show how many rows are left using `nrow(crimeMovies)`.

<codeblock id="03_04">
</codeblock>
</exercise>

<exercise id="5" title="Comparison operators and chaining comparisons">

Let's look at the following `filter()` statement:

```{r}
filter(biopics, year_release > 1980 & 
    type_of_subject == "Criminal")
```

Three things to note:

+ We used the comparison operator `>`. The basic comparisons you'll use are `>` (greater than), `<` (less than), `==` (equals to) and `!=` (not equal to) 
+ We also chained on another expression, `type_of_subject == "Criminal"` using `&` (and). The other chaining operator that you'll use is `|`, which corresponds to OR. 
+ Chaining expressions is where `filter()` becomes super powerful. However, it's also the source of headaches, so you will need to carefully test your chain of expressions.

###Instructions

+ Add another comparison to the chain using `&`. Use `person_of_color == FALSE`. 
+ Show how many rows are left from your filter statement.

<codeblock id="03_05">
</codeblock></exercise>

<exercise id="6" title="Quick Quiz about Chaining Comparisons">

<codeblock id = "03_06">
</codeblock>

Which statement should be the larger subset? Try them out in the console if you're not sure.

<choice>
<opt text="filter(biopics, year_release > 1980 & type_of_subject == 'criminal')">Nope. This should be the smaller subset (because you're applying both criteria)
</opt>
<opt text="filter(biopics, year_release > 1980 | type_of_subject == 'criminal')" correct="true">Good Job! Yes, when you use an OR (|), it results in a larger subset. Let's move on.
</opt></choice>
</exercise>

<exercise id="7" title="The %in% operator">

What if you wanted to select for multiple values? You can use the `%in%` operator. Here we put the values into a `vector` with the `c()` function, which concatentates the values together into a form that R can manipulate. Note that these values have to be exact and the case has to be the same (that is, "UK", not "Uk" or "uk") for the matching to work.

```{r}
biopicsUSUK <- biopics %>% filter(country %in% c("US", "UK"))
```

### Instructions

+ Pick out the `Musician`, `Artist` and `Singer` movies from `type_of_subject`. 
+ Assign the output to `biopicsArt`.



<codeblock id="03_07">
</codeblock></exercise>

<exercise id="8" title="Removing Missing Values">

One trick you can use `filter()` for is to remove missing values. Usually missing values are
coded as `NA` in data. You can remove rows that contain `NAs` by using `is.na()`. For example:

```{r}
filter(biopics, !is.na(box_office))
```

Note the `!` in front of `is.na(box_office)`. This `!` is known as the NOT operator. Basically,
it switches the values in our `is.na` statement, making everything that was `TRUE` into `FALSE`, 
and everything `FALSE` into `TRUE`. We want to keep everything that is not `NA`, so that's why 
we use the `!`. 

### Instructions

+ Filter `biopics` to remove the NAs, and assign the output to `filteredBiopics`. 
+ Compare the number of rows in `biopics` to `filteredBiopics`. 
+ How many missing values did we remove?



<codeblock id="03_08">
</codeblock></exercise>

<exercise id="9" title="dplyr::mutate()">

`mutate()` is one of the most useful `dplyr` commands. You can use it to transform data 
(variables in your `data.frame`) and  add it as a new variable into the `data.frame`. 
For example, let's calculate the total `box_office` divided by the `number_of_subjects` 
to normalize our comparison as `normalized_box_office`: 

```{r}
biopics2 <- mutate(biopics, normalized_box_office = box_office/number_of_subjects)
```
What did we do here? First, we used the `mutate()` function to add a new column into our 
`data.frame` called `normalized_box_office`. This new variable is calculated per row by dividing
`box_office` by `number_of_subjects`.

### Instructions

+ Try defining a new variable `race_and_gender` by pasting together `subject_race` and `subject_sex`
into a new `data_frame` called `biopics2`. 
+ Show the first few rows using `head()` so you can confirm that you added this new variable correctly.

Remember, you can use the `paste()` function to paste two strings together.

<codeblock id="03_09">
`paste(subject_race, subject_sex)`
</codeblock>
</exercise>

<exercise id="10" title="You can use mutated variables right away!">

The nifty thing about `mutate()` is that once you define the variables in the statement,
you can use them right away, in the same `mutate` statement. For example, look at this code:

```{r}
mutate(biopics, 
    box_office_year = year_release * box_office, 
    box_office_subject = paste0(box_office_year, subject))
```

Notice that we first defined `box_office_year` in the first part of the `mutate()` statement,
and then used it right away to define a new variable, `box_office_subject`. 

### Instructions

+ Define another variable called `box_office_y_s_num` in the same `mutate()` statement by taking  `box_office_year` and dividing it by `number_of_subjects`. 
+ Assign the output to `mutatedBiopics`.

<codeblock id="03_10">
Add `box_office_y_s_num=box_office_year/number_of_subjects` to the statement below.
</codeblock>
</exercise>

<exercise id="11" title="Another Use for `mutate()`">

What is this statement doing? Try it out in the console if you're not sure.

```{r}
mutate(biopics, subject= paste(subject, year_release))
```

<codeblock id="03_11">
</codeblock>

<choice>
<opt text="We are defining a brand-new variable with the same name in our dataset and keeping the old variable as well" correct="true">
Great! Now you know you can also use `mutate()` to process variables in place.</opt>
<opt text="We are processing the variable `subject` and saving it in place">
Try it out. Did we add another variable?</opt>
</choice>
</exercise>

<exercise id="12" title="The difference between `filter()` and `mutate()`">

What is the difference between these two statements? Try them out in the console if you're not sure.

```{r}
biopics %>% 
    filter(year_release > 1998) %>% 
    head()
```

```{r}
biopics %>% 
    mutate(isNewer = year_release > 1998) %>% 
    head()
```
<codeblock id = "03_12">
</codeblock>

<choice>
<opt text="The first statement should have a larger number of rows than the second one" correct="true">
Yes! I'm glad you understand the difference.</opt>
<opt text="The first statement filters the data, whereas the second statement defines a new boolean variable.">
Not the case! Try comparing the number of rows.</opt>
<opt text="The second statement is more confusing.">
Yes, this is correct! We're identifying a new variable that we can use to flag the data.</opt>
</choice>
</exercise>

<exercise id="13" title="The Pipe Operator: %>%">

We're going to introduce another bit of `dplyr` syntax, the `%>%` operator. `%>%` is called a `pipe` operator. 
You can think of it as being similar to the `+` in a `ggplot2` statement.

What `%>%` does is that it takes the output of one statement and makes it the input of the next statement. When I'm describing it, I think of it as a "THEN". For example, I read the following expression

```{r}
biopics %>% filter(race_known == "Known") %>%
    mutate(poc_code = as.numeric(person_of_color))
```
As: I took the `biopics` data, 
THEN  I `filter`ed it down with the `race_known == "Known"` criteria and 
THEN I defined a new variable called `poc_code`.

Note that `filter()` doesn't have a `data` argument, because the `data` is `piped` into `filter()`. Same thing for `mutate()`.

`%>%` allows you to chain multiple verbs in the `tidyverse`. It's one of the most powerful things about the `tidyverse`. 

In fact, having a standardized chain of processing actions is called a **pipeline**. Making pipelines for a data format is great, because you can apply that pipeline to incoming data that has the same formatting and have it output in a `ggplot2` friendly format.

### Instructions

+ Use `%>%` to chain `biopics` into a `filter` to select (`country=="US"`) 

<codeblock id="03_13">
</codeblock>
</exercise>

<exercise id="14" title="group_by()/summarize()">

`group_by()` doesn't do anything by itself. But when combined with `summarize()`, you can 
calculate metrics (such as `mean`, `max` - the maximum, `min`, `sd` - the standard deviation) across groups. For example:

```{r}
countryMeans <- biopics %>% 
                    filter(!is.na(box_office)) %>% 
                    group_by(country) %>% 
                    summarize(mean_box_office = mean(box_office))
```

Here we want to calculate the mean `box_office` by `country`. However, in order to do that, we first need to remove
any rows that have `NA` values in `box_office` that may confound our calculation.

Let's ask a tough question. Is there a difference between mean `box_office` 
between the two `subject_sex` categories? 

### Instructions

First use `filter()` to remove the NA values. Then, use `group_by()` and `summarize()` to 
calculate the mean `box_office` by `subject_sex`, naming the summary
variable as `mean_bo_by_gender`.  Assign the output to `gender_box_office`. 

<codeblock id="03_14">
</codeblock>
</exercise>

<exercise id="15" title="Counting Stuff">

What does the following code do? Try it out in the console!

```{r}
biopics %>% group_by(type_of_subject) %>% summarize(count=n())
```

<codeblock id="03_15">
</codeblock>


<choice>
<opt text="just shows the regular `biopics` `data.frame`">
Nope. Try it out and see what it does.</opt>
<opt text="counts each `type_of_subject` and puts it in another table" correct="true">Now you know how to use `group_by()` and `summarize()` to count categories.
</opt>
</choice>
</exercise>

<exercise id="16" title="arrange()">

`arrange()` lets you sort by a variable. If you provide multiple variables, the variables are 
arranged within each other. For example:

```{r}
biopics %>% arrange(country, year_release)
```

This statement will sort the data by `country` first, and then within each `country` category, 
it will sort by `year_release`.

### Instructions

Sort `biopics` by `year_release` then by `lead_actor_actress`. Assign the output to `biopics_sorted`.

<codeblock id="03_16">
</codeblock></exercise>

<exercise id="17" title="select()">

The final verb we'll learn is `select()`. `select()` allows you to: 

1) extract columns, 
2) reorder columns or 
3) remove columns from your data, as well as 
4) rename your data. 

For example, look at the following code:

```{r}
biopics %>% select(movieTitle=title, box_office)
```
Here, we're just extracting two columns (`title_of_movie`, `box_office`). Notice we also renamed `title` to `movieTitle`.

### Instructions

Use `select` to extract the following variables: `title` (rename it `movieTitle`), `box_office` and `subject_sex` and assign them to a new table called `threeVarTable`.

<codeblock id="03_17">
</codeblock></exercise>

<exercise id="18" title="Chester Ismay's Mantra">

What is the difference between `select()` and `filter()?`

<choice>
<opt text="`select()` works on booleans, whereas `filter()` works on all data types">Nope. Both of these verbs don't care what data type you use.
</opt>
<opt text="`select()` only works after `filter()`">Not true. You can use `filter()` and `select()` in any order!
</opt>
<opt text="`select()` works on columns, `filter()` works on rows" correct = "true">
Welcome to the cult of `dplyr`! Your secret decoder ring is in the mail.
</opt>
</choice>
</exercise>

<exercise id="19" title="Challenge 1: Putting it all together">

Now here comes the fun part. Chaining `dplyr` verbs together to accomplish some data cleaning and transformation.

For a reference while you work, you can use the `dplyr` cheatsheet here: https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

### Instructions

+ For the `biopics` data, `filter()` the data so that we only cover movies from 2000 to 2014. (`year_release` is the variable you want.)
+ Filter out the NAs in `box_office`.
+ Then  use `mutate()` to code a new variable, `box_office_per_subject`. (The two variables you need here are `box_office` and `number_of_subjects`.)
+ Assign this statement to `biopics_new`.
+ Run `summary()` on `biopics_new` to confirm that your statement worked.

<codeblock id="03_19">
</codeblock></exercise>

<exercise id="20" title="Challenge 2: Show your stuff">

Answer the question: Do movies where we know the race is known (`race_known` == TRUE) make more 
money than movies where the race is not known (`race_known`== FALSE) grouped by country? 
Which `race_known`/`country` combination made the highest amount of money?

### Instructions

+ You'll need to do a `filter` step first to remove `NA` values from `box_office` before you do  anything. 
+ Then think of what variables you need to `group_by`. 
+ Finally, figure out what do you need to `summarize` (assign the value to `mean_box_office`) 
and `arrange` on (don't forget to use `desc`!)? 
+ Assign the output to `race_country_box_office`.
+ Show `race_country_box_office`.



<codeblock id="03_20">
You can do this!</codeblock></exercise>

<exercise id="21" title="Challenge 3: Putting together what we know about ggplot2 and dplyr">

Now we're cooking with fire. You can directly pipe the output of a `dplyr` pipeline
into a `ggplot2` statement. For example:

```{r}
biopics %>%
    filter(year_release >= 2000 & year_release <= 2014) %>%
    mutate(box_office_per_subject = box_office / number_of_subjects) %>%
    ggplot(aes(x = year_release, y=box_office_per_subject)) +
    geom_point()
```

Note that we use `%>%` to pipe our statement into the `ggplot()` function. The
tricky thing to remember is that everything after the `ggplot()` is connected with
`+`, and not `%>%`. 

Also note: we don't assign a `data` variable in the `ggplot()` statement. We are piping
in the data. 

Are you sick of `biopics` yet? I promise this is the last time we use this dataset.

### Instructions

+ First, filter `biopics` to have `year_release` < 1990 and remove `NA` values. 
+ Then pipe that into a `ggplot()` statement that plots an x-y plot of `box_office` 
(use `geom_point()`) where `x=year_release` and `y=log(box_office)`. 
+ Color the points by `person_of_color`. 
+ Assign the output to `bPlot` and print it to the screen using `print(bPlot)`.

<codeblock id="03_21">
</codeblock></exercise>

<exercise id="22" title="What you learned in this chapter">

- How to use `%>%` (the pipe)
- `dplyr::filter()`
- `dplyr::mutate()`
- `dplyr::group_by()/dplyr::summarize()`
- `dplyr::arrange()`
- `dplyr::select()`
- How to put it all together!

Good job for making it through this chapter! You're well on your way
to becoming a `tidyverse` ninja!

</exercise>

