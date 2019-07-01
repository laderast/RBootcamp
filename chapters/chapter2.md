---
title: 'Chapter 2: ggplot2 and categorical data' 
description: More on plotting using ggplot2
prev: /chapter1
next: /chapter3
id: 2
type: chapter
---
<exercise id="1" title="Review of factors">

Factors are how R represents categorical data.

There are two kinds of factors: 

+ `factor` - used for *nominal* data ("Ducks","Cats","Dogs")
+ `ordered`- used for *ordinal* data ("10-30","31-40","41-60")

We'll manipulate our barplots and add more information using factors.

Here's the simple dataset we'll use to investigate how to work with factors in `ggplot2`.

+ Using the console, look at the `pets` dataset. 
+ Use the `glimpse()` function (it is part of the `dplyr` package, which we load for you) on `pets` to see the levels for the different categories.

<codeblock id="02_01">
</codeblock></exercise>

<exercise id="2" title="A Basic Barplot using `geom_bar()`">

Now that we understand what categories exist in our dataset, we can begin to visualize them using barplots generated with the `geom_bar()` geom.

The `geom_bar()` default is to count the number of values with each factor level. Note that you don't map to a y-aesthetic here, because the y values are the counts.

Given this dataset, we might want to ask how many pets have the same name.

Map the `name` variable to `x` in the `ggplot` statement. What is the most popular name?



<codeblock id="02_02">
</codeblock></exercise>

<exercise id="3" title=" Stacked Bars">

Let's see how many of each animal got shots. We can do this by mapping `shotsCurrent` to `fill`.

Map `shotsCurrent` to the `fill` aesthetic.



<codeblock id="02_03">
</codeblock></exercise>

<exercise id="4" title="Quick Quiz">

What does mapping `color` to `"black"` in `geom_bar()` do? For example:

```{r}
ggplot(pets, aes(x=animal, fill=shotsCurrent)) + 
  geom_bar(color="black")
```

<img src = "pet_black.png">

<choice>
<opt text="Makes the default bar fill color black">
Great! That's one tip for improving the appearance of your bar graph.</opt>
<opt text="Specifies the text in the graph to be black">
Not quite. Look at the graph. What is being mapped to `black`?</opt>
<opt text="Outlines the bars in black" correct="true">
Good! Yes, we are outlining the bars in `black`.</opt>
</choice>
</exercise>

<exercise id="5" title="Proportional Barchart">

We may only be interested in the relative proportions between the different categories. 
Visualizing this is useful for various 2 x 2 tests on proportions. By mapping `position = "fill"`, 
we can show proportions rather than counts. 

Change the `position` argument in `geom_bar()` to `"fill"`. What percent of dogs did not receive shots?


<codeblock id="02_05">
</codeblock>
</exercise>

<exercise id="6" title="Dodge those bars!">

Instead of stacking, we can also dodge the bars (move the bars so they're beside each other).

Change the `position` argument in `geom_bar()` to `"dodge"`.

<codeblock id="02_06">
</codeblock>
</exercise>

<exercise id="7" title="Faceting a graph">

Say you have another `factor` variable and you want to stratify the plots based on that. 
You can do that by supplying the name of that variable as a facet. Here, we facet our barplot by `shotsCurrent`.

```{r}
ggplot(data=pets, mapping=aes(x=name)) + geom_bar() + 
  ##have to specify facets using "~" notation
  facet_wrap(facets=~shotsCurrent) + 
  ##we make the x axis x angled for better legibility
  theme(axis.text.x = element_text(angle=45))
```

You might notice that there are blank spots for the categories in each facet. We can remove these in each facet by using `scale="free_x"` argument in `facet_wrap()`.

Add `free_x` to the scale argument. How many animals named "Morris" did not receive shots? 

<codeblock id="02_07">
</codeblock>
</exercise>

<exercise id="8" title="Super Quick Review">

Faceting a graph allows us to:

```{r}
ggplot(pets, aes(x=name)) + geom_bar() + 
  facet_wrap(facets=~shotsCurrent, scale="free_x") +
  theme(axis.text.x = element_text(angle=45))
```

<choice>
<opt text="plot points as pretty gems">
Not that kind of facet!</opt>
<opt text="stratify our graph by another category" correct="true">
Yes! Faceting is a way of visualizing information by stratifying on an additional variable.</opt>
<opt text="add another set of categories to the x-axis">
Not right.</opt>
</choice>
</exercise>

<exercise id="9" title="Your Task: Bar Charts">

Now you'll put everything you've learned together into a single barplot.

Given the `pets` `data.frame`:
+ plot a stacked proportional barchart that shows the `ageCategory`  counts by `animal` type. 
+ Facet this plot by `shotsCurrent`. 

Is the proportion of animals receiving shots the same across each age category?

<codeblock id="02_09">
Think about what to map to `x`, and what to map to `fill`, and what `position` argument 
you need for `geom_bar()`. Finally, think about how to facet the variable. </codeblock></exercise>

<exercise id="10" title="Boxplots">

Boxplots allow us to assess distributions of a continuous variable (`weight`) conditioned on categorical variables (`shotsCurrent`).

<img src="pet_shot.png">

What does this tell us? Is there a difference in weight between those animals who recieved shots or not?

<choice>
<opt text="there is a small difference in means, but the difference doesn't look significant" correct="true">
Yes, this appears to be the case. The interquartile ranges are overlapping, so it's probably not significant.</opt>
<opt text="there is no difference in means">
This is a judgement call, but there is a small difference in means between the groups</opt>
<opt text="there is a large difference in means and the difference is probably statistically significant">
Probably not true. The interquartile ranges are overlapping, so it's probably not a significant difference in means.</opt>
</choice>
</exercise>

<exercise id="11" title="Try out geom_boxplot() yourself">

Plot a boxplot of `weight` conditioned on `animal`. Is there a difference in weight between animal types?



<codeblock id="02_11">
Think about what variables map to what aesthetics. </codeblock></exercise>

<exercise id="12" title="Violin Plots">

Violin plots are another useful way to visualize the data. They provide a more nuanced look at the data. They're a density plot that's mirrored around the y-axis.

+ Add `geom_violin()` to the ggplot statement. 
+ How does the violin plot compare to the boxplot? 
+ Does it show less or more information?



<codeblock id="02_12">
</codeblock></exercise>

<exercise id="13" title = "Your final task: How heavy are our pets?">

+ Visualize `weight` by `animal` type. 
+ Plot both boxplots and a violin plot on the same graph.
+ What do you conclude? Which kind of animal weighs more on average than the other? 

<codeblock id = "02_13">
</codeblock>
</exercise>

<exercise id="14" title="What you learned in this chapter">

- How to visualize categorical data
- Three more types of plots: `geom_bar()`, `geom_boxplot()` and `geom_violin()`
- Aesthetics that can be mapped to these geoms (`fill`, `x`, `y`)
- Options for `geom_bar()`: `position = "fill"` (proportional bars) and `position = "dodge"` (dodged bars)
- How to stratify your graphs using `facet_wrap()`
- More about how to put together a ggplot

Just move on to the next chapter! 

<codeblock id="02_14">
</codeblock></exercise>

