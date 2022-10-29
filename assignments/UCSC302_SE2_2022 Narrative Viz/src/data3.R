
# Dummy Data generated using Mockaroo.com
library(readr)
data <- read_csv("data/raw/breakfast.csv")

# Process the data into processed/breakfast.csv
D <- table(data[,2])
print(D)
View(data)

write.csv(D,file = "data/processed/breakfast.csv")