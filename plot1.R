#download and unzip data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "./data/power_consumption.zip", mode = "wb")
unzip("./data/power_consumption.zip", exdir = "./data")

#read in dataset and subset for 1/2/2007 and 2/2/2007
dataset <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", dec = ".", 
                      colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")
dataset <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

#convert date and time colum to POSIXlt column 'date_time'
dataset$date_time <- with(dataset, paste(Date, Time))
dataset$date_time <- strptime(dataset$date_time, format = "%d/%m/%Y %H:%M:%S")

#Create plot 1
par(mfrow = c(1,1), bg = "transparent")
with(dataset, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off()

