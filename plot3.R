library(data.table)
source("uci.datasource.R")

Sys.setlocale("LC_ALL", "en_US.UTF-8")
png("plot3.png")
with(UCI.data, {
  plot(Timestamp,
       Sub_metering_1,
       type = "l",
       ylab = "Energy sub metering",
       xlab = "")
  lines(Timestamp, Sub_metering_2, col = "red")
  lines(Timestamp, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()
rm(UCI.data, UCI.data_source.filename, UCI.data_source.zip)