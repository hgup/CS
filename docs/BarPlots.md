# Bar Plots
This is a demo so as to get you hands on with the code to create a good looking bar plot. You will have to create the xlsx data on your own which is not much of a big deal. You also need to know how to set up the relative path links. If you are good to go and can read data from the file (as shown below) then you can start.


## Basic Skeleton

This is how you should start when you are making a bar plot, I won't go into the details of what are the contents but in general this is what your
goals are when making a plot.

### Goals

- Create an output device (like a pdf, or just `RStudioGD` for seeing output in R Studio itself)
- Add default params (using `par`)
- Read the Data
- Sort (optional)
- Attach it, the data that you will use (more on it later)
- Plot it
- Iterate and prepare highlights
- Iterate through the data and add the required labels
- Add other elements, highlights and text using `text`, `arrows`, and superimposing `barplot` etc
- Add some `mtext` and give metadata.

### Philosophy
Everything has to be given coordinates based on the main bar plot, try to minimize hardcoding values and use them directly from the plot.
E.g. if `x <- barplot(...` then `x[1]` will give the coordinate of the first plot.


### How?

**Create an output Device**

```r
pdf_file <- "pdf/believe.pdf"
cairo_pdf(pdf_file, bg = "grey98", width = 9, height = 6.5)
```
Here you added the height and width of the pdf too. Depending on use-case.


**Add default params**

```r
par(omi = c(0.65, 0.25, 0.75, 0.75),
    mai = c(0.3,2,0.35,0),
    mgp = c(3,3,0),
    family = "Inter Light",
    las = 1)

```
Convention: `c(b,l,t,r)` (sounds like MLTR)

![Margins](images/margins.png)

`omi`: Set the **o**uter **m**argins in **i**nches

`mai`: Set the **ma**rgin size specified in **i**nches 

`mar`: margin in lines

`oma`: outer margin area in lines

`mgp`: Unknown

`las`: style of axis labels


NOTE: A neat trick to increase all margins together
```r
par(mar=c(5,4,4,2) + 0.1)
```


**Read the Data**

```r
# Import data and prepare chart
library(readxl)
women <- read_excel("data_files/responses_from_women.xlsx")
```

**Sort (optional)**

```r
sort.women<- women[order(women$Percent),]
```
Try to figure out the logic by yourself. We will not be using it in our example here.


**Attach it**
```r
attach(women)

# ...
# ...
# ...

detach(women) # Do it!
```

Attach the database to use `women` instead of `women$Attitude`. Also don't forget
to detach it when you are done using the data.

**Plot it**

This is the standard command for plotting bars in R, let's explore it.

```r
x <- barplot( Percent, names.arg = F, horiz = T, border = NA,
              xlim = c(0,100), col = "#272727", cex.names = 0.85, axes = F)
```
`Percent` is the vector that we supplied to it.

`names.arg`: unknown

`horiz`, to plot horizontally, instead of vertically (default)

`border` is usually a number, but can be removed by using `NA`

`xlim` is the limit of the data, that's what it will set for the available plotting space.

`col` is used to set the color. Either use hex values like `#272727` (as shown), or names like `"grey"` (there are some predefined colors as such, check docs), or have full control by using the `rgb(...)` function.

`cex.names` is redundant here since we have turned off labels

`axes` is set to `F` to hide the axes.


**Iterate and highlight**

```r
for (i in 1: length(Attitude)){
  if (Percent[i] == max_per) { highlight <- c(highlight,Percent[i]) }
  else { highlight <- c(highlight, 0) }
}

x_hi <- barplot( highlight, names.arg = F, horiz = T, border = NA,
              xlim = c(0,100), col = "#2B50AA", cex.names = 0.85, axes = F, add = T)
```
We just select a portion of data by filtering out using a loop and then we use plot that data (superimpose it, persay) by using an additional argumet `add = T` which implies that we won't overwrite the previous plot, rather add to it.

**Iterate and Label**

```r
for (i in 1: length(Attitude)){
  if (Percent[i] == max_per)
  {
    myfont = "Inter Regular"
    highlight <- c(highlight,Percent[i])
  }
  else
  {
    myfont = "Inter Thin"
    highlight <- c(highlight, 0)
  }
  text(4.5, x[i], format(Percent[i],nsmall = 1), xpd = F, adj = 0, col= 'white', cex = 0.8, family = "Inter Light")
  text(-1.5, x[i],paste(strwrap(Attitude[i],width = 40),collapse = '\n'), xpd = NA, adj = 1, cex = 0.65, family = myfont)
  
}

```
Figure it out, and also `x[i]` is taking the values of the y-axis from the plot and using it here. This makes sense because we already know the x-axis coordinates which we passed in as `Percent` to plot the bars in the first place.

You will notice a complex command 
```r
paste(strwrap(Attitude[i],width = 40),collapse = '\n')
```
Let's break it down.

Our `Attitude[i]` is too big for one line so we want it to break lines every 40 characters. We do it by first breaking a single string `a` into a vector of strings like so

```r
d <- strwrap(a, width = 40); d

#[1] "A working mother can establish just as"
#[2] "warm and secure an environment as a"   
#[3] "non-working mother" 
```
This returns a vector of strings, now stored in `d`. Now we need to re-concatenate them together but with a separator `\n` which is the escape sequence for a new character.

```r
paste(d, collapse = '\n'

# [1] "A working mother can establish just as\nwarm and secure an environment as a\nnon-working mother"
```
There we go.

**Add other elements**

```r
# Rects
for (i in 1:5){
  if (i %% 2 == 1)
    { myalpha <- 40 } else { myalpha <- 70}
  rect((i-1)*20,0,i*20,10, col = rgb(136,229,240,myalpha, maxColorValue = 255), border = NA)
}

# Arrows and stuff
arrows(50,-0.15,50,9.15, 0, xpd = NA, col="#379c92", lwd = 1.5)
arrows(50,-0.15,50,0.1, 0, xpd = NA, col="#17301c", lwd = 3)
arrows(50,8.90,50,9.15, 0, xpd = NA, col="#17301c", lwd = 3) 

```
Note that `lwd` specifies the size of the arrows and `xpd` is used to specify whether to put the graphic inside(`F`) the plot, outside(`T`) the plot or on the device(`NA`) [i.e. irrespective of the plot region].

```r
text(48,9.048, "Majority", font = 3,family= "Inter Thin", adj = 1, xpd = T, cex = 0.7)
text(52,9.05, "50%", font = 1,family= "Inter Regular", adj = 0, xpd = T, cex = 0.7)
text(100,9.05, "all values in %", font = 1,family= "Inter Thin", adj = 1, xpd = T, cex = 0.6)
```
Remember that `adj` is used to justify the text.

**Add some `mtext` and give metadata**

```r
mtext(c(0,20,40,60,80,100), at = c(0,20,40,60,80,100), 1, line = 0, cex = 0.80)

mtext("It is often said that attitudes towards gender roles are changing",3, font=1, line = 1.6,
      adj = 0, cex = 1.2, family = "Inter Black", outer = T)

mtext("Agree strongly/ agree",3, font = 2, adj = 0, cex = 1, family = "Inter Thin", outer = T)
mtext("Source: The voices in my head. Docs: https://hgup.github.io/cs",1, font = 3, adj = 1, cex = 0.6, family = "Inter Light", outer = T)
```
The second parameter `1 (bottom) 2 (left) 3 (top) 4 (right)` specifies on which margin to place th text.

The `at = c(0,20,40,60,80,100)` attribute allows a vector of strings or numbers to be placed at those designated positions. Here, with respect to the x-axis.


**Finally**
```r
detach(women)

dev.off() # to flush (make changes permanent on) the pdf file
```

# Final Output

<object data="../pdf/gender.pdf" width="90%" height="auto" type='application/pdf'></object>
