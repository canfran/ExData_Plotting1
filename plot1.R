

#Reading the data frame only extracting data from the dates 2007-02-01 and 2007-02-02
f <- file("household_power_consumption.txt")
d <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE), 
                col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                sep = ";", header = TRUE)

#Plot FIRST graph
hist(d$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Copy into jpg file
dev.copy(png, file = "plot1.png") 
dev.off() 
