library(data.table)

setClass("UCITime")
setAs("character", "UCITime", function(from) as.POSIXct(from, format="%H:%M:%S"))

UCI.data_source.filename <- "household_power_consumption.zip"
if (!file.exists(UCI.data_source.filename)) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = UCI.data_source.filename)
}

unzip(zipfile =  UCI.data_source.filename, files = c("household_power_consumption.txt"))
# UCI.data <- fread("household_power_consumption.txt",
#                   header = TRUE,
#                   colClasses = c("UCIDate", "UCITime", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
#                   sep = ";",
#                   na.strings = "?")
# unlink(tmpfile)
UCI.data <- fread("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  colClasses = c("UCIDate", "UCITime", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                  na.strings = "?")[, Date:=as.Date(Date, format="%d/%m/%Y")][,Time:=as.POSIXct(Time, format="%H:%M:%S")]

UCI.data <- UCI.data[UCI.data$Date >= as.Date("2007-02-01") & UCI.data$Date <= as.Date("2007-02-02"),]