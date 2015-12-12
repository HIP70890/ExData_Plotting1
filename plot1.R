library(data.table)
source("uci.datasource.R")

png("plot1.png")
hist(UCI.data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()