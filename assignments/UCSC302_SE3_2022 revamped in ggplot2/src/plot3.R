library(ggplot2)

theme_set(theme_bw())

ggplot(mtcars, aes(gear, fill = factor(cyl))) +
  geom_bar(width = 0.7) +
  labs(title = "Gears w/ Cylinders",
       subtitle = "No. of each gear type subcategorized into Cylinders",
       fill = "Cylinders",
       x = "Gear Type",
       y = "Number",
       caption = "Source: mtcars")+
  scale_fill_brewer(palette="OrRd")+
  xlim(c(2.5,5.5))

# in the doc: ... stands for the name should be an aesthetic (e.g. fill)
ggsave('output/plot3.pdf',width=7, height = 7)