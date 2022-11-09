library(ggplot2)
theme_set(theme_bw())

ggplot(mtcars,aes(x = wt, y = mpg)) +
  geom_point(stat = "identity", aes(col = factor(cyl))) +
  xlim(c(1,6))+
  ylim(c(1,5)*8)+
  labs(title = "MPG vs WT",
       col = "# of \nCylinders",
      subtitle = "Relationship between mileage and weight of mtcars",
      caption = "Source: mtcars",
      x = "Weight",
      y = "Miles Per Gallon")


ggsave('output/plot4.pdf',width = 7, height = 7)