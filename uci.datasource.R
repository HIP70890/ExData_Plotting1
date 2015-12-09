library(data.table)

setAs("character", "UCIDate", function(from) as.Date(from, format="%d/%m/%Y"))

UCI.data_source.filename <- "household_power_consumption.zip"
if (!file.exists(UCI.data_source.filename)) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = UCI.data_source.filename)
}

tmpfile <- tempfile()
UCI.data <- read.csv(unz(description =  UCI.data_source.filename, filename = "household_power_consumption.txt"),
                     colClasses = c("UCIDate", "character",
                                    "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                     sep = ";",
                     na.strings = "?")
unlink(tmpfile)

UCI.data <- UCI.data[UCI.data$Date >= as.Date("2007-02-01") & UCI.data$Date <= as.Date("2007-02-02"),]