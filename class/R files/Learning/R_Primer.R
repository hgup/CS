########################## BASICS AND HELP
1+2
# [1] 3

#[1] signifies that this is the first element of the result vector 
#try
seq(11:60)

####################################
#R prompts for input... try the following

max(4,5,
    
    3)
#####################################

#q() #to exit
#help.start() for starting page of help
#help(func_name)
#example(func_name)
#args(func_name)
#help.search(item) or ??item
help(package="ggplot2")
#vignettes are additional documents such as tutorials, intros etc. 
#vignette()
vignette(package="ggplot2")
vignette("ggplot2-specs")


###################################### DATA TYPES

#everything in R is an object
# 6 basic data types - 
#character "a" "z" 
#numeric(real or decimal) 3 12.3  
#integer 5L (L is an instruction to store as an integer)
#logical TRUE FALSE
#complex 1+2i 

#TODO
#(raw)
#CLASS VS TYPE VS MODE

class()
typeof()
length()
attributes()
nchar("sairam hi there")
####### printing 
pi
sqrt(5)
print(pi)

#print knows the format in which to print
#print can print only one object at a time

print("the value of pi is ",pi,"in two decimals")

print(cat("the value of pi is",pi,"with decimals","\n"))
#cat puts a space

########### setting var

x<-3
y<-5
print(sqrt(x^2+y^3))

#variable held in workspace; we an change variable's data type at will
x<-"sunday"
print(x)
x<<-5 
#global variable
# = assignment; -> can also be used; check the difference

#CHECK SCOPE
######### listing variables
ls()
ls.str()
#the str() is called for showing the variable structure

rm(x)
rm(list =ls())
#dangerous
ls()

#Data structures - matrix, array, lists, ... 

################### VECTORS
#understood as atomic vectors not lists...
#types - character, logical, integer, numeric
#empty vector with 
a<-vector();a

b<-vector("logical",length=3);b

logical(5)

#or...
vec1=c(1,2,5)
# c for combine
typeof(vec1)
vec2=c("sun","mon")
vec3=c(vec1,vec2)

vec4=c(vec2,as.character("3"));vec4
a<-c(1,0,as.logical(3));a
a<-c(1,0,as.numeric(FALSE));a
a<-c(TRUE,FALSE,as.numeric(2));a

#vectors cannot contain mix data types... all numbers converted to strings
# data elements can co-exist in a vector only if they have the same mode..

# NA
x<-c("mon",NA,"wed");x

#comparing  == != < > <= >=

c(1,2,3,pi)==pi
# Boolean values TRUE FALSE

somenumbers=c(1,2,5,2,3,4);somenumbers
somenumbers[4]=100;somenumbers
somenumbers[4:6]=100;somenumbers

somenumbers[-2]
#excludes that particular value

somenumbers[somenumbers<10]

somenumbers %% 5 ==0
#true for multiples of 5
somenumbers[somenumbers %% 5 ==0]

somenumbers[somenumbers>mean(somenumbers)]
somenumbers[(somenumbers<5)|(somenumbers>95)]

#special values NA, Inf, NaN
length(somenumbers)
somenumbers[7]=NA;somenumbers
somenumbers[17]=NA;somenumbers

is.na(somenumbers)
somenumbers[is.na(somenumbers)]
#existence checking
anyNA(somenumbers)

1/0

0/0


marks<-c(75,85,95)
names(marks)<-c("chem","phy","math")
marks
marks["chem"]

#arithmetic
#create two vectors and try the following
#+ - * / ^ sqrt(vec) log(vec) sin(vec) ....

#operator precedence 

# binary operators %something%
# %% modulo
5%%2
# %/% integer division
5%/%2
# %*% matrix multiplication

# %in% true if left operand occurs in right operand, false otherwise
2 %in% seq(1:10)

# %>% pipe operator





####  sequences and repetitions
1:11
x<-seq(1:11);x
y<-seq(from=2,to=-12,by=-2)
y2<-seq(from=2,to=-12,length.out=5);y2
z=rep(3,times=3);z
10:20
20:10


# basic stats
mean(x)
median(x)
sd(x)
var(x)
cor(x,y)
cov(x,log(x+1))


#pipe (you need library(magrittr) .. 
#for some functions library(dplyr) may be enough)

1:10 %>% mean()
#mean(1:10)

round(pi,3)
pi %>% round(3)
3 %>% round(pi, digits=.)

x<-seq(1:10)
mx=max(x)
mx %>% max(2,.)
mx %>% max(20,.)

paste(10:15,letters[10:15])
10:15 %>% paste(.,letters[.])

sin(cos(90))
f<- . %>% cos() %>% sin()
f(90)


a=10;a=sqrt(a);a

# it is sent as a first argument, corresponding arguments can be casually passed.
a=10;a<- a %>% sqrt();a

a=10; a%<>%sqrt; a

# T-junction; tee operator
# continue to pipe the original material (seq(1:10))
# even after it has been plugged once (in plot(., seq...) onto the next %>% mean(.)
seq(1:10) %T>% plot(., seq(from = 1,to = 100,by = 10)) %>% mean(.)


