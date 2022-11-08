library(ggplot2)

#p <- ggplot(aes(y=mpg, x = wt, color = disp), data = mtcars) + geom_point()

#p <- ggplot(aes(y=mpg, x = wt, color = disp, shape = factor(cyl)), data = mtcars) + geom_point()

#df <- as.data.frame(table(mtcars$carb))


#ggplot(t,aes(x = "",y = ))
ggplot(aes(y=mpg,x=cyl,color=cyl),data=data)+geom_point()+geom_smooth()

ggsave("output/mtcars.pdf",width = 8,height=8)
