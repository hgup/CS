# Questions

[-] Q1: Create a pie chart showing the proportion of cars from the mtcars data set that have different carb values.

- add percentages
- change colorscheme

[-] Q2: Create a bar graph, that shows the number of each gear type in mtcars.

- change x labels (3, 3.5, 4,...) 

[-] Q3: Next show a stacked bar graph of the number of each gear type and how they are further divided out by cyl.

- change color theme

[-] Q4: Draw a scatter plot showing the relationship between wt and mpg.

- 

[] Q5: Design a visualization of your choice using the data and write a brief summary about why you chose that visualization.

# Note

Layers: Data, Aes, Stat (transformations), Geom (object), pos (adjustment)

Scales: data to aesthetic attributes

Coord: System for positioning (cartesian, semi-log, polar)

```r
+ layer(
mapping = NULL, # from aes (in `ggplot()`) if `NULL`
data = NULL, # override current dataset, usually ommitted
geom = "point", # name of the geometric object. geom_params = <list>
stat = "identity", # to keep the data as is. stat_params = <list>
position = "identity" # adjust overlapping objects: jittering, stacking, dodging
)
```

Mapping Aesthetics to constants in order to label them (name each layer)

```r
ggplot(mpg, aes(displ, hwy)) +
geom_point() +
geom_smooth(aes(colour = "loess"), method = "loess", se = FALSE) +
geom_smooth(aes(colour = "lm"), method = "lm", se = FALSE) +
labs(colour = "Method")
```




# Useful Code Snippets

Wherever I mentioned commands with a `+command`, I meant an additional grammatical layer.

```r
+theme(legend.position = "none")
```
```r
> vignette("ggplot2-specs")
```
```r
quote(a + math ^ expression) # try it
```


