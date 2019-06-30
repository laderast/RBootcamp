---
type: slides
---

# Anatomy of a ggplot2 figure

---

# Mapping variables to produce geometric plots

A statistical graphic consists of:

+ A `mapping` of variables in `data` to
+ `aes()`thetic attributes of
+ `geom_`etric objects.

In code, this is translated as:

```r
ggplot(data = gap1992, mapping = aes(x = log(gdpPercap), y=log(pop))) +
  geom_point()
```
---

# Anatomy of a ggplot statement

```r
ggplot(data = gap1992, mapping = aes(x = log(gdpPercap), y=log(pop))) +
  geom_point()
```

Let's take the above example code apart. A `ggplot2` call always starts with the `ggplot()` function. In this function, we need two things:

1. `data` - in this case, `gap1992`.
2. `mapping` - An aesthetic mapping, using the `aes()` function. 

In order to map our variables to aesthetic properties, we will need to use `aes()`, which is our `aes()`thetic mapping function. In our example, we map `x` to `log(gdpPercap)` and `y` to `log(pop)`.

Finally, we can superimpose our geometry on the plot using `geom_point()`.

---

# Let's practice!


