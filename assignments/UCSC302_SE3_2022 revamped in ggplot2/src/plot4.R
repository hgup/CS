library(ggplot2)
theme_set(theme_bw())
source("src/settings.R")

ggplot(mtcars,aes(x = wt, y = mpg)) +
  geom_point(stat = "identity", aes(col = factor(cyl))) +
  ylim(c(1,5)*8)+
  labs(title = "MPG vs WT",
       col = "# of \nCylinders",
      subtitle = "Relationship between mileage and weight of mtcars",
      caption = "Source: mtcars",
      x = "Weight (tonnes)",
      y = "Miles Per Gallon") + 
  theme(plot.title = head_txt,
        plot.margin = margin(15,15,10,15))+
  scale_x_continuous(breaks = c(0:6))
  


ggsave('output/plot4.pdf',width = 7, height = 7)