library(readr)
breakfast <- read_csv("F:/HURSH 211219/cs/assignments/UCSC302_SE2_2022 Narrative Viz/data/raw/breakfast.csv")

library(ggplot2)
p = ggplot(data = breakfast,aes(x = name,  y = feeling, fill = feeling)) +
  geom_bar(stat = "count", width=0.85) +
  scale_fill_brewer(palette="Blues") +
  coord_flip()


ggsave("output/Bar Plots/plot2.pdf",width = 10,height=8)