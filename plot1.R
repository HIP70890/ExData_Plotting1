library(data.table)

UCI.data_source.filename <- "household_power_consumption.zip"

if (!file.exists(UCI.data_source.filename)) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = UCI.data_source.filename)
}