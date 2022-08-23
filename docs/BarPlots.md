# Basic Skeleton

This is how you should start when you are making a bar plot, I won't go into the details of what are the contents but in general this is what your
goals are when making a plot.

### Goals

- Create an output device (like a pdf, or just `RStudioGD` for seeing output in R Studio itself)
- Add default params (using `par`)
- Read the Data
- Sort (optional)
- Attach it, the data that you will use (more on it later)
- Plot it
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
ipsos <- read_excel("data_files/ipsos.xlsx")
```


