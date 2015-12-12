library(data.table)
source("uci.datasource.R")

png("plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(UCI.data, {
  plot(Timestamp,
       Global_active_power,
       type = "l",
       ylab = "Global Active Power",
       xlab = "")
  plot(Timestamp,
       Voltage,
       type = "l",
       ylab = "Voltage",
       xlab = "datetime")
  plot(Timestamp,
       Sub_metering_1,
       type = "l",
       ylab = "Energy sub metering",
       xlab = "")
  lines(Timestamp, Sub_metering_2, col = "red")
  lines(Timestamp, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Timestamp,
       Global_reactive_power,
       type = "l",
       xlab = "datetime")
})
dev.off()