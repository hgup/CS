
# Dummy Data generated using Mockaroo.com
library(readr)
data <- read_csv("data/raw/Waking up early.csv")

# Process the data into processed/waking_up.csv
responses<- c(
  "I feel refreshed",
  "I feel dizzy and irritated",
  "I can plan my day better",
  "I don't feel tired throughout the day"
)
D <- NULL
for (i in c(2:5)){
  D <- rbind(D,c(as.numeric(table(data[,i]))))
}
D <- cbind(responses,D)
colnames(D) <- c("Attitude","A","AS","D","DS","N")
print(D)

write.csv(D,file = "data/processed/waking_up.csv")