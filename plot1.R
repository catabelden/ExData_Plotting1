
## PLOT 1
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
plot1 <- hist(as.numeric(subdata$Global_active_power), 
              col = "red", 
              main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()