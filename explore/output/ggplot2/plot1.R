# Load ggplot2
library(ggplot2)
library(readxl)
library(stringr)
#library(RColorBrewer)
# Create data
data <- read_excel("data/responses_from_women.xlsx")
data$Att_lab <- str_wrap(data$Attitude,width=40)

# grammar of graphics
# read hgup.github.io

# Barplot
p = ggplot(data = data,aes(Att_lab, Percent, fill = Att_lab)) +
  geom_bar(stat="identity",width=0.85) +
  scale_fill_brewer(palette="Blues") +
  coord_flip()

p + scale_color_brewer(palette = "Pastel1")

# geom_bar( ... data$Att_lab <- str_wrap(data$Attitude,width=40))
ggsave("output/Bar Plots/plot1.pdf",width = 10,height=8)
# Load ggplot2
# Load ggplot2
library(ggplot2)
library(readxl)
library(stringr)
#library(RColorBrewer)
# Create data
data <- read_excel("data/responses_from_women.xlsx")
data$Att_lab <- str_wrap(data$Attitude,width=40)

# grammar of graphics
# read hgup.github.io

# Barplot
p = ggplot(data = data,aes(Att_lab, Percent, fill = Att_lab)) +
  geom_bar(stat="identity",width=0.85) +
  scale_fill_brewer(palette="Blues") +
  coord_flip()

p + scale_color_brewer(palette = "Pastel1")

# geom_bar( ... data$Att_lab <- str_wrap(data$Attitude,width=40))
ggsave("output/Bar Plots/plot1.pdf",width = 10,height=8)
library(ggplot2)
library(readxl)
library(stringr)
#library(RColorBrewer)
# Create data
data <- read_excel("data/responses_from_women.xlsx")
data$Att_lab <- str_wrap(data$Attitude,width=40)

# grammar of graphics
# read hgup.github.io

# Barplot
p = ggplot(data = data,aes(Att_lab, Percent, fill = Att_lab)) +
  geom_bar(stat="identity",width=0.85) +
  scale_fill_brewer(palette="Blues") +
  coord_flip()

p + scale_color_brewer(palette = "Pastel1")

# geom_bar( ... data$Att_lab <- str_wrap(data$Attitude,width=40))
ggsave("output/Bar Plots/plot1.pdf",width = 10,height=8)
