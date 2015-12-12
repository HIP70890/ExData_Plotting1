library(data.table)
library(chron)

UCI.data_source.zip <- "household_power_consumption.zip"
UCI.data_source.filename <- "household_power_consumption.txt"
if (!file.exists(UCI.data_source.filename)) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = UCI.data_source.zip)
}

unzip(zipfile =  UCI.data_source.zip, files = UCI.data_source.filename)
UCI.data <- fread(UCI.data_source.filename,
                  header = TRUE,
                  sep = ";",
                  colClasses = c("UCIDate", "UCITime", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                  na.strings = "?")[, Date:=as.Date(Date, format = "%d/%m/%Y")]
UCI.data <- UCI.data[UCI.data$Date >= "2007-02-01" & UCI.data$Date <= "2007-02-02",]
UCI.data <- UCI.data[, Timestamp:=as.POSIXct(paste(Date, Time))]

