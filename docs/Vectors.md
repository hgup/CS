## 3.2.4 Testing and Coercion

- Avoid using `is.Atomic()` or `is.Vector()` because, they don't work like your typical `is.numeric()` or `is.double` or `is.character`. Check the documentation to know what they really do.

- **type** is the property of the entire _Atomic_ Vector (having homogeneous type). When attempted to add different vector types together the folling **coercion** will happen and in the following order

$$
\text{character} \to \text{double} \to \text{integer} \to \text{logical}
$$
(the first one has the highest "say", and hence the other element is coerced into the prior.)

- `FALSE` becomes `0` and `TRUE` becomes `1`

```r
a <- 1:3
attr(a,"x") <- "abcdef"
attr(a,"x")

attr(a,"y") <- 4:6
str(attributes(a))

a <- structure(
    1:3,
    x = "abcdef",
    y = 4:6
)

str(attributes(a))
str(a)
```

# 3.3 Attributes

- They are ephemeral. That is, when operations are done on the vectors then the attributes are not *carried over* to the output.

## 3.3.2 Names

Vectors can be named. Think of them like "named values", like a function in python `def f(a = 1, b = 2)` uses variables to hold the input.
```r
x <- c(a = 1, b = 2, c = 3)


# character vector to names(<vector>)
x <- 1:3
names(x) <- c("a","b","c")

# inline
x <- setNames(1:3, c("a","b","c"))

```

- NOTE that `names` is also an **attribute** so we can technically use
```r
attr(x, "names")
```
But, we should avoid using them as this makes typing them harder than necessary.

- to unname do: `unname(x)` or `names(x) <- NULL`

Names should be:
 - Unique
 - Non missing

(but this is not enforced by R)

## 3.3.3 Dimensions

Dimension is an attribute that allows a vector(linear) to act like a **$2-d$ *matrix** or a **multi-dimensional array**.

A matrix can be created as such
```r
a <- matrix(1:6, nrow = 2, ncol = 3)
a
```
Notice that here we use the $ \textrm{row} \times \textrm{column}$ syntax

How we create multidimensional arrays is by using `array()` as follows
```r
b <- array(1:12, c(2,3,2))
b
```

We can also set (general) dimensions dynamically
```r
c <- 1:6
dim(c) <- c(3,2)
c
```

$$
\textrm{The best way to think about this should be as follows. You have a linear vector that you can break using an } n \times m \times k \textrm{ arrangement} and by doing so, you first fill up the first } n \textrm{members and then move on to the next } n \textrm{ members in the next line. Till you finish } m \textrm{ such lines. After which the trend continues so that you can fill up} k {such sub-matrices.}
$$