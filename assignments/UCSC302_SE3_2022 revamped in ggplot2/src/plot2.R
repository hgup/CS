library(ggplot2)



ggplot(mtcars, aes(x = gear)) +
  geom_bar(width = 0.5, fill = rgb(30,60,50,255, maxColorValue = 255))+
  labs(title = "Gears",
       x = "Gear Type",
       y = "Number",
       subtitle = "No. of each gear type",
       caption = "Source: mtcars")

ggsave("output/plot2.pdf")