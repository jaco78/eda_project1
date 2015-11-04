#downloading and reading in dataset commented out - uncomment if necessary (selecting lines 3-16 and using CTRL + SHIFT + C)

# #download and unzip data
# if(!file.exists("./data")){dir.create("./data")}
# fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileUrl, "./data/power_consumption.zip", mode = "wb")
# unzip("./data/power_consumption.zip", exdir = "./data")
# 
# #read in dataset and subset for 1/2/2007 and 2/2/2007
# dataset <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", dec = ".", 
#                       colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")
# dataset <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))
# 
# #convert date and time colum to POSIXlt column 'date_time'
# dataset$date_time <- with(dataset, paste(Date, Time))
# dataset$date_time <- strptime(dataset$date_time, format = "%d/%m/%Y %H:%M:%S")

#Create plot3.png
png("plot3.png", width = 480, height = 480, bg = "transparent")
with(dataset, {
    plot(date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(date_time, Sub_metering_2, col = "red")
    lines(date_time, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(dataset)[7:9])})
dev.off()