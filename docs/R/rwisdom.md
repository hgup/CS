---
layout: default
title: R-Wisdom
parent: R Programming
nav_order: 1
---

# R Wisdom

## dev.off()

Sometimes plots don't show up in rstudio's default plot plane. In order to get them there, we must first turn **off** the existing devices by using `dev.off()` till there is only a `null device` left.

## fonts

While setting fonts, you have two aspects.

- The family of the font
- The type of the font

To set the family you have to use `family = "Inter Black"`, the available options are `Black`, `Thin`, `Light`, `Medium` etc.

Along with that you will have to mention that you want to use bold font or not, for that, refer to [this section](Plot-Properties#fonts)
 (hint: use `font = 2` for bold)

## Reading the docs

- Every parameter starts with the type of input that is compatible with it.

## Graphics

### Parameters

#### `adj`
Specifies how text strings are justified.

0 - Left Justified;

0.5 - Centered;

1 - Right Justified;


### Commands

- `rect(l,b,r,t,...)`
- `points(px, py, pch = 15, cex = 4, col = ..., xpd = T)` These are used to create some point graphics. `pch` defines what type of **dot** to be used. `cex` for size.

## Looping

```r
for(i in 1: length(dataset)){
# Do manipulations here
}

```

## Barplots

If you would like to superimpose on another graph use the property `add = T`

## Reading Files

- `readxl` package works very good for reading and importing data from xlsx files.
- to read one row use the command

```r
data[1,]
```
assuming that the data from the excel file is loaded to variable `data`.


## Matrix

if `m` is a matrix then
```r
m[1,1] # gives the 1,1 element
m[1,] # gives the first row
m[,1] # gives the first column
```

The `,1` syntax might not make sense, so think of it this way. `,1` syntax gives you all `n,1` results

## Par Values

- When using the `omi` values: only outer margin gets increased. That is the portion of the graph that was clipped will remain the same even after the margin is applied.
- When using the `mai` values: the size of the plot is reduced allowing you to fit more in the same space (*inside the outer margin*). Hence, when things are not fitting, increase `mai`.

## Wrapping Labels

In the `dataframe` use this

```r
# Att_lab : Attitude labels
data$Att_lab <- str_wrap(data$Attitude,width=40)
```
then plot the `data$Att_lab`
