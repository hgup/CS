x <- c(TRUE, TRUE, FALSE)
as.numeric(x)

mean(x)

?raw

as.raw(x)

as.integer(c("1.5","2","c"))

c(1,FALSE)
c("A",1)
c(TRUE, 1L)
1 == 1

c(1,NA)
FALSE + NA
FALSE * NA

# ATTRIBUTES

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

attributes(a[1])
attributes(sum(a))

# DIMENSIONS

a <- matrix(1:6, nrow = 2, ncol = 3)
a

b <- array(1:12, c(2,3,2))
b

c <- 1:6
dim(c) <- c(3,2)
c

# FACTORS

x <- factor(c("a","b","b","a"))
x

typeof(x)

str(attributes(x))

s_char <- c("m","m","m")
s_factor <- factor(s_char, levels = c("m","f"))

table(s_char)

table(s_factor)
