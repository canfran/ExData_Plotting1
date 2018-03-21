

#Reading the data frame only extracting data from the dates 2007-02-01 and 2007-02-02
f <- file("household_power_consumption.txt")
d <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE), 
                col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                sep = ";", header = TRUE)


#Plot FOURTH graph
timing <- paste(as.Date(d$Date, "%d/%m/%Y"), d$Time) # converting to Date class
d$timing <- as.POSIXct(timing)

d <- d[which(d$Global_active_power != "?"),] # get rid of missing values

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(d, {
  plot(Global_active_power ~ d$timing, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ d$timing, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ d$timing, type = "l", ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2 ~ d$timing, col = 'Red')
  lines(Sub_metering_3 ~ d$timing, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ d$timing, type = "l", ylab = "Global_rective_power", xlab = "datetime")
})

#Copy into jpg file
dev.copy(png, file = "plot4.png") 
dev.off() 