library(data.table)
source("uci.datasource.R")

Sys.setlocale("LC_ALL", "en_US.UTF-8")
png("plot2.png")
with(UCI.data,
     plot(Timestamp,
          Global_active_power,
          type = "l",
          ylab = "Global Active Power (kilowatts)",
          xlab = "")
     )
dev.off()
rm(UCI.data, UCI.data_source.filename, UCI.data_source.zip)