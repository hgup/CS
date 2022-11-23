source("src/base.R")




theme_set(theme_light())
par(family = "Inter Light")
plot <- ggplot(sub,aes(x = `India/States`, y = `NIC Name`, fill = `Main Workers - Total - Females`,)) +
  geom_tile(colour = "white") +
  scale_fill_gradient(low = "#33aadd",high = "#33ddaa") +
  labs(
    title = "Female Workers in Puducherry State",
    subtitle = "in the interval 100 to 200",
    fill = "Female\nWorkers",
    caption = "data from data.gov.in"
    
  )


plot + theme(
  plot.title = element_text(size = 30,hjust = 7, face = 2),
  plot.margin = margin(20,5,5,5),
  plot.subtitle = element_text(family = "mono", size= 15, face = 3, hjust = 1),
  
  )

ggsave("output/plot2.pdf",width = 12, height = 9)