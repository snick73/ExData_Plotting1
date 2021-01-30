# calling the dplyr library 
library(dplyr) 
# reading the tx file 
power <-  read.table("household_power_consumption.txt",header = TRUE, sep = ";")
# subsetting for 1/02/2007 and 2/02/2007
power <- filter(power, Date == "1/2/2007"  |  Date == "2/2/2007")

# plotting

datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

activepower <- as.numeric(power$Global_active_power)
reactivepower <- as.numeric(power$Global_reactive_power)
voltage <- as.numeric(power$Voltage)
submeter1 <- as.numeric(power$Sub_metering_1)
submeter2 <- as.numeric(power$Sub_metering_2)
submeter3 <- as.numeric(power$Sub_metering_3)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# creating the png file

par(mfrow = c(2, 2)) 

plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submeter1, type="l", ylab="Energy submeter", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file = "plot4.png", width=480, height=480)

dev.off()