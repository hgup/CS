---
title: Plot Properties
author: hgup
date: 2022-08-01
categories: [R, Plotting]
parent: R Programming
nav_order: 1
tags: [Programming]
---

# Bar Plots

This creates a bar plot. Here are the Related Syntax and the output.
```r
data_1 <- c(3,7)
barplot(data_1)
```

## Labels and Colors

We can set labels and colors for the plot, look at the following example.
```r
barplot(c(3,7),
    main = "This is the main Title",
    xlab = "X axis label",
    ylab = "Y axis label",
    sub = "Subtext for the bar graph",
    col.main = "red",
    col.lab = "green",
    col.sub = "black"
)
```
- `main` is the main title
- `xlab` and `ylab` are the labels for the axes
- `subtext` appears under the X-axis (some subtitle)
- `col.*` syntax is used to set color to the components for the barplot.

## Fonts

Different font styles can be set, in order to do so, use the `font` attribute and
the following number codes to get the desired result.


| 1 | Normal Text     |
|---|-----------------|
| 2 | Bold            |
| 3 | Italic          |
| 4 | Bold and Italic |
| 5 | Symbol Font     |

```r
barplot(c(3,7),
    main = "Main Title",
    xlab = "X axis",
    ylab = "Y axis",
    sub = "Subtitle",
    font.main = 2,
    font.lab = 3,
    font.sub = 4)
```

## Size

Use the `cex` attribute to change the size of the desired text
Here is a sample usage

```r
barplot(c(3,7),
        main = "Main Title",
        xlab = "X axis",
        ylab = "Y axis",
        sub = "Subtitle",
        font.main = 2,
        font.lab = 3,
        font.sub = 4
)
```

# Adding Titles to plots
For obvious reasons, we need to add **titles** to our plots.
Here are few ways to do it.

### Inline syntax

```r
x <- 1:10; y <- x**3
plot(x,y,
     main = "This is the main Title",
     xlab = "X axis label",
     ylab = "Y axis label",
)
```
### Adding titles after plotting.
What if you already wrote a plot, and want to add the title afterwards?

```r
x <- 1:10; y <- x**3
plot(x,y, main = "", xlab="", ylab="",
     col.axis="blue")
title(main = "The Cubes", sub = "This is how we add titles using title()",
      xlab = "numbers", ylab = "their cubes",
      cex.main = 2,   font.main= 4, col.main= "red",
      cex.sub = 0.75, font.sub = 3, col.sub = "green",
      col.lab ="darkblue"
)
```
> Always remember to set the labels to `""`(null) else the titles etc would be printed **over the default labels**.
{: .prompt-warning }

# The `Par` function

The modifications made by the `par` is made to all plots in the current R session and are **permanent**

```r
par(
  # Change the colors
  col.main="blue", col.lab="blue", col.sub="black",
  # Titles in italic and bold
  font.main=4, font.lab=4, font.sub=4,
  # Change font size
  cex.main=2, cex.lab=1.7, cex.sub=1.2
)

# To test the changes
barplot(c(2,5), main="Simple Barplot",
    	xlab="X axis ",
    	ylab="Y axis ",
    	sub="Sub title")
```

# Legends

Legends are created to label the data plotted, so that the viewer can make sense out of the given plots. Hence it is an extremely important part of the plot and must be set to be easily comprehensible and readable.

| `x` and `y`  | the x and y co-ordinates to be used to position the legend                                                                                              |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| `legend`     | text of the legend                                                                                                                                      |
| `fill`       | color to use for filling the boxes beside the legend text                                                                                               |
| `col`        | colors of lines and points beside the legend text                                                                                                       |
| `bg`         | the background color for the legend box.                                                                                                                |
| `text.font`  | the fonts discussed in the previous session                                                                                                             |
| `box.*`      | `lty`:line type, `lwd`:line width, `col`:color (for the legend box border)                                                                              |
| **position** | first argument that specifies the position, keywords: "bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right" and "center" |

Sample usages:
```r
legend("topleft", legend=c("Line 1", "Line 2"),
   	col=c("red", "blue"), lty=1:2, cex=0.8)
```

And here we use the `x` and `y` coordinates
```r
legend(2, 4, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8,
       box.lty=2, box.lwd=2, box.col="green")
```

```r
text(x, y, labels)
```
