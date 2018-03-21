

#Reading the data frame only extracting data from the dates 2007-02-01 and 2007-02-02
f <- file("household_power_consumption.txt")
d <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE), 
                col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                sep = ";", header = TRUE)


#Plot SECOND graph
timing <- paste(as.Date(d$Date, "%d/%m/%Y"), d$Time) # converting to Date class
d$timing <- as.POSIXct(timing)

d <- d[which(d$Global_active_power != "?"),] # get rid of missing values

plot(d$Global_active_power ~ d$timing, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


#Copy into jpg file
dev.copy(png, file = "plot2.png") 
dev.off() 