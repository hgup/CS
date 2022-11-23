#data.R

not <- c("STATE - PUDUCHERRY","District - Puducherry")
sub <- subset(data,!(data$`India/States` %in% not) & data$`NIC Name` != "Total" & data$`Main Workers - Total -  Persons` %in% c(100:200))
