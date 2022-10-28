# The data provided, gives us the following information
# - type of med
# - power of the med
# - pack size

# since power is not a good measure of comparison (as different drugs
# do different things), and pack size is also irrelevant.
# Thus, we will use only the `type of med`.

# GOAL: To see the distribution of type of most life saving drugs.

# IDIOM: A pie chart.

library(readxl)
data <- read_excel("data/CGHS_life_saving_drugs.xls", col_types = c("skip", "text"))

dataset <- table(data)