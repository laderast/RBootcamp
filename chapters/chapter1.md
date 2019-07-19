---
title: 'Chapter 1: The Magic of ggplot2' 
description: Learn how ggplot2 turns variables into statistical graphics
prev: null
next: /chapter2
id: 1
type: chapter
---
<exercise id="1" title="Quick Data Frame Introduction">

Let's review the basics of `data.frame`s.

A `data.frame` is basically a table-like format which has the following properties: 

<img src="tidy-1.png">

- Columns can each have a different type (`numeric`, `character`, `boolean`, `factor`)
- Columns are called "variables"
- Rows correspond to a single observation (ideally)
- Can be subset or filtered based on criteria

Individual variables within a `data.frame` can be accessed with the `$` operator (such as `gap1992$pop`). We won't use this very often, as the `tidyverse` lets us access the variables without it, as you'll see.

Run `colnames()` and `head()` on the `gap1992` data to see what's in each column. Then see how many rows there are in the dataset using `nrow()`. Run these in console before you submit your answer.



<codeblock id="01_01">
</codeblock></exercise>

<exercise id="2" title="Thinking about aesthetics">
Now that we've learned a little about the `data.frame`, we can get to the fun part: making graphs.

The first thing we are going to is think about how we represent variables in a plot. 

How do we visually represent a variable in our dataset? Take a look at this graph. What variable is mapped to `y`, and what is mapped to `x`, and what is mapped to `color`?

<img src="gap1992.png">

<choice>
<opt text="x = gdpPercap, y = log(lifeExp), color = continent">
You have things reversed, and you're taking the log of the wrong variable</opt>
<opt text="x = continent, y = year, color = pop">
Wrong variables. Go back and look at what's being mapped</opt>
<opt text="y = lifeExp, x = log(gdpPercap), color = continent" correct = "true">
Correct! We are displaying lifeExp as our y variable and log(gdpPercap) as our x variable</opt>
</choice>
</exercise>

<exercise id="3" title="Mapping variables to produce geometric plots">

A statistical graphic consists of:

+ A `mapping` of variables in `data` to
+ `aes()`thetic attributes of
+ `geom_`etric objects.

In code, this is translated as:

```{r}
ggplot(data = gap1992, mapping = aes(x = log(gdpPercap), y=log(pop))) +
  geom_point()
```

Let's take the above example code apart. A `ggplot2` call always starts with the `ggplot()` function. In this function, we need two things:

1. `data` - in this case, `gap1992`.
2. `mapping` - An aesthetic mapping, using the `aes()` function. 

In order to map our variables to aesthetic properties, we will need to use `aes()`, which is our `aes()`thetic mapping function. In our example, we map `x` to `log(gdpPercap)` and `y` to `log(pop)`.

Finally, we can superimpose our geometry on the plot using `geom_point()`.

Based on the graph below, map the appropriate variables to the `x`, and `y` aesthetics. Run your plot. Remember, you can try plots out in the console before you submit your answer.

<img src="gap1992.png">


<codeblock id="01_03">
Look at the graph. If you need the variable names, you can always use `head()` or `colnames()` on the `gap1992` dataset.</codeblock></exercise>

<exercise id="4" title="More about aes">
For `geom_point()`, there are lots of other aesthetics. The important thing to know is that
aesthetics are properties of the `geom`. If you need to know the aesthetics that you can 
map to a `geom`, you can always use `help()` (such as `help(geom_point)`).

For a list of aesthetics for `geom_point()`, look here: [http://ggplot.yhathq.com/docs/geom_point.html](http://ggplot.yhathq.com/docs/geom_point.html)
and look at all the aesthetic mappings. 

Which of the following is *not* a mappable aesthetic to `geom_point()`?

<choice>
<opt text="`x`">
Not quite. You need `x` to map a point!</opt>
<opt text="`shape`">
Nope. This is a mappable aesthetic to `geom_point().`</opt>
<opt text="`linetype`" correct = "true">
Correct. `linetype` is not mappable to `geom_point()`. Points don't have a `linetype`, do they?</opt>
</choice>
</exercise>

<exercise id="5" title="Points versus lines">

The great thing about `ggplot2` is that it's easy to swap representations. 
Instead of x-y points, we can plot the data as a line graph by swapping `geom_line()`
for `geom_point()`.

First run the code to see the plot with points. Change the `geom_point()` in the following graph to `geom_line()`. What happened?
How did the visual presentation of the data change?



<codeblock id="01_05">
</codeblock></exercise>

<exercise id="6" title="Geoms are layers on a ggplot">

We are not restricted to a single geom on a graph! You can think of geoms
as layers on a graph. Thus, we can use the `+` symbol to add geoms to our
base `ggplot()` statement. 

Add both `geom_line()` and `geom_point()` to the following ggplot. Are the results what you expected?



<codeblock id="01_06">
</codeblock>
</exercise>


<exercise id="7" title="Quick review about ggplot2">

What does the `+` in a `ggplot` statement do? 

For example:

```{r}
ggplot(gap1992, aes(x = log(gdpPercap), y = lifeExp, color=continent)) +
  geom_line() + geom_point()
```

<choice>
<opt text="adds one `data.frame` to another `data.frame` ">
This is not the case. Go back and look at the ggplot code.</opt>
<opt text="allows you to chain data and geoms together into a single statistical graphic" correct="true">
Correct! This is how we can add data and layer geoms together</opt>
<opt text="allows you to add variables together in a `data.frame`">
Look at the ggplot code and see if we are manipulating data or not. Are we?</opt>
</choice>
</exercise>

<exercise id="8" title="Final Challenge: Recreate this Gapminder Plot">

Your final challenge is to completely recreate this graph using the `gap1992` data.

<img src="gap1992.png">

- If you need to remember variable names, you can always call `head(gap1992)` or `colnames(gap1992)` in the console.
- Recreate the above graphic by mapping the right variables to the right aesthetic elements. Remember, you can try plots out in the console before you submit your answer.

<codeblock id="01_08">
</codeblock></exercise>

<exercise id="9" title="What you learned in this chapter">

- Basic `ggplot2` syntax.
- Plotting x-y data using `ggplot2` using both `geom_point()` and `geom_bar()`.
- Mapping variables in a dataset to visual properties using `aes()`
- `geom`s correspond to layers in a graph.
- That `ggplot2` can make some pretty cool graphs
- That you can do this!

**More Resources**

- [R For Data Science: Visualization](https://r4ds.had.co.nz/data-visualisation.html). The visualization chapter of R for Data Science. Especially useful are the [Aesthetic Mapping](https://r4ds.had.co.nz/data-visualisation.html#aesthetic-mappings) and the [common problems](https://r4ds.had.co.nz/data-visualisation.html#common-problems) sections.
- There's a lot more to `ggplot2`! Take a look at [The Layered Grammar of Graphics](https://r4ds.had.co.nz/data-visualisation.html#the-layered-grammar-of-graphics) to see the other ways we can modify plots, such as scales and coordinates.

<codeblock id="01_09">
</codeblock></exercise>

