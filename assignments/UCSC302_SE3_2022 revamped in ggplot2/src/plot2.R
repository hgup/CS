library(ggplot2)

theme_set(theme_bw())
source("./src/settings.R")


ggplot(mtcars, aes(x = gear,fill = factor(gear))) +
  geom_bar(width = 0.7)+
  labs(title = "Gears",
       x = "Gear Type",
       y = "Number",
       subtitle = "No. of each gear type",
       caption = "Source: mtcars")+
  scale_fill_brewer(palette = "Pastel2")+
  theme(legend.position = "none", plot.title = head_txt,
        axis.text.x= element_text(size = 11)) +
  scale_x_continuous(breaks = c(3,4,5), labels = c("Type 3", "Type 4", "Type 5"))+
  scale_y_continuous(breaks = c(0,5,10,12,15))

ggsave("output/plot2.pdf",width = 7, height = 7)
