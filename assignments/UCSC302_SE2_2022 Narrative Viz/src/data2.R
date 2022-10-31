
# Dummy Data generated using Mockaroo.com
library(readr)
data <- read_csv("data/raw/sports played by students.csv")

# Process the data into processed/sports_played.csv
D <- table(data[,2])
print(D)

write.csv(D,file = "data/processed/sports_played.csv")