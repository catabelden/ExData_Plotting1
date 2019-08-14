## PLOT 2
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#transform Date and Time variables into objects type Date and POSIXlt
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format = "%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(subdata$Time, 
     subdata$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()