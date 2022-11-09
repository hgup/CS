# Q1: Create a pie chart showing the proportion of cars from the mtcars data set that have different carb values.

library(ggplot2)


ggplot(mtcars, aes(x = "", fill = factor(carb))) +
  geom_bar(width = 1) +
  theme(axis.line = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  labs(fill = "carbs",
       x = NULL,
       y = NULL,
       title = "the proportion of cars that having diff carb values",
       caption = "Source: mtcars") +
  coord_polar(theta = "y", start = 0)

ggsave("output/plot1.pdf")

# todo
# 1. add percentages