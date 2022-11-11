# Q1: Create a pie chart showing the proportion of cars from the mtcars data set that have different carb values.

library(ggplot2)
library(scales)

theme_set(theme_minimal())
source("./src/settings.R")

tC <- rev(table(mtcars$carb))

brks <- as.matrix(cumsum(tC)) - 0.5 * as.matrix(tC)
percs <- paste(round(tC/sum(tC)*100,digits = 2),"%", sep = "")
# real breakthrough logic here

ggplot(mtcars, aes(x = "", fill = factor(carb) )) +
  geom_bar(width = 1) +
  theme(plot.margin = margin(10,5,10,15),plot.title = element_text(colour = rgb(30,30,30,100,maxColorValue = 100),size= 20,hjust = 0.5,face = "bold")) +
  labs(fill = "# of \nCarburators",
       x = NULL,
       y = NULL,
       title = "Distribution of Carburator types in Cars",
       caption = "Source: mtcars") +
  coord_polar(theta = "y", start = 0, direction = 1)+
  scale_fill_brewer(palette = "Oranges") +
  scale_y_continuous(breaks = brks, labels = percs)

ggsave("output/plot1.pdf", height=7, width=7)

# todo
# 1. add percentages