library(ggplot2)
theme_set(theme_bw())
source("src/settings.R")

ggplot(mtcars,aes(x = hp, y = mpg)) +
  geom_point(stat = "identity", aes(col = factor(vs))) +
  ylim(c(1,5)*8)+
  labs(title = "MPG vs HP",
       col = "Engine",
      subtitle = "Relationship between mileage and Horsepower of mtcars",
      caption = "Source: mtcars",
      x = "Gross Horse Power",
      y = "Miles Per Gallon") + 
  theme(plot.title = head_txt, plot.margin = margin(15,15,10,15))+
  scale_x_continuous() +
  scale_fill_manual(labels = c("V-Shaped","Straight"), values = c("tomato","cyan3"))
  


ggsave('output/plot5.pdf',width = 7, height = 7)