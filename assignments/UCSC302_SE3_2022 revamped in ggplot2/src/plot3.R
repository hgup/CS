library(ggplot2)

theme_set(theme_bw())
source("src/settings.R")

ggplot(mtcars, aes(gear, fill = factor(cyl))) +
  geom_bar(width = 0.7) +
  labs(title = "Gears w/ Cylinders",
       subtitle = "No. of each gear type subcategorized into Cylinders",
       fill = "# of\nCylinders",
       x = "Gear Type",
       y = "Number",
       caption = "Source: mtcars")+
  scale_fill_brewer(palette="OrRd")+
  scale_x_continuous(breaks = c(3,4,5), labels = c("Type 3", "Type 4", "Type 5"))+
  scale_y_continuous(breaks = c(0,5,10,12,15))+
  theme(axis.text.x = element_text(size = 11), plot.title = head_txt, plot.margin = margin(15,15,10,15))


# in the doc: ... stands for the name should be an aesthetic (e.g. fill)
ggsave('output/plot3.pdf',width=7, height = 7)