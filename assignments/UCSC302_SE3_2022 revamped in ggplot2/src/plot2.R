library(ggplot2)

theme_set(theme_bw())


ggplot(mtcars, aes(x = gear,fill = factor(gear))) +
  geom_bar(width = 0.7)+
  labs(title = "Gears",
       x = "Gear Type",
       y = "Number",
       subtitle = "No. of each gear type",
       caption = "Source: mtcars")+
  scale_fill_brewer(palette = "Pastel2")+
  theme(legend.position = "none") +
  lims(x = c(2.5,5.5)) #this hack worked

ggsave("output/plot2.pdf",width = 7, height = 7)