library(ggplot2)

#df <- as.data.frame(table(mpg$class))
#
#colnames(df) <- c("class","freq")
#
#ggplot(df, aes(x = "", y = freq, fill = factor(class))) +
  #geom_bar(width = 1, stat = "identity")+
  #theme(axis.line = element_blank(),
        #plot.title = element_text(hjust = 0.5))+
  #labs(fill = "class",
       #x = NULL,
       #y = NULL,
       #title = "Pie Chart",
       #caption= "Source: mpg")+
  #coord_polar(theta = "y", start = 0)
#
#ggplot(mpg, aes(x = "", fill = factor(class))) +
  #geom_bar(width = 1) +
  #theme(axis.line = element_blank(),
        #plot.title = element_text(hjust = 0.5)) +
  #labs(fill = "class",
       #x = NULL,
       #y = NULL,
       #title = "Pie Chart of Class",
       #caption = "Source: mpg")+
  #coord_polar(theta = "y", start = 0)
#
#
#
# prep
cty_mpg <- aggregate(mpg$cty, by = list(mpg$manufacturer), FUN = mean)

colnames(cty_mpg) <- c("make","mileage")

cty_mpg <- cty_mpg[order(cty_mpg$mileage), ]

cty_mpg$make <- factor(cty_mpg$make, levels = rev(cty_mpg$make)) # why do we do this line?
# ANS: Ordered Bar Chart is a Bar Chart that is ordered by the Y axis variable. Just sorting the dataframe by the variable of interest isn’t enough to order the bar chart. In order for the bar chart to retain the order of the rows, the X axis variable (i.e. the categories) has to be converted into a factor.

#NOTES: try changing the `levels = (cty_mpg$make)` to `levels = rev(cty_mpg$make)` the barplot sorts in the order of the levels of the factor. (S M L)

theme_set(theme_bw())

ggplot(cty_mpg, aes(x = make, y = mileage)) +
  geom_bar(stat = "identity", width=  0.5, fill = "tomato3") +
  labs(title = "ordered Bar Chart",
       subtitle = "Make Vs Avg. Mileage",
       caption = "Source: Mpg") +
  theme(axis.text.x = element_text(angle=65, vjust = 0.6))



ggsave("output/tryplot.pdf")