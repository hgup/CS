# dev.off()

Sometimes plots don't show up in rstudio's default plot plane. In order to get them there, we must first turn **off** the existing devices by using `dev.off()` till there is only a `null device` left.

# fonts

While setting fonts, you have two aspects.

- The family of the font
- The type of the font

To set the family you have to use `family = "Inter Black"`, the available options are `Black`, `Thin`, `Light`, `Medium` etc.

Along with that you will have to mention that you want to use bold font or not, for that, refer to [this section](Plot-Properties#fonts)
 (hint: use `font = 2` for bold)

# Reading the docs

- Every parameter starts with the type of input that is compatible with it.
# Graphical Parameters

## `adj`
Specifies how text strings are justified.

0 - Left Justified;

0.5 - Centered;

1 - Right Justified;

# Graphics

`rect(l,b,r,t,...)`

# Looping

```r
for(i in 1: length(dataset)){
# Do manipulations here
}

```

# Barplots

If you would like to superimpose on another graph use the property `add = T`
