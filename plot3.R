# calling the dplyr library 
library(dplyr) 
# reading the tx file 
power <-  read.table("household_power_consumption.txt",header = TRUE, sep = ";")
# subsetting for 1/02/2007 and 2/02/2007
power <- filter(power, Date == "1/2/2007"  |  Date == "2/2/2007")

# plotting

datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

activepower <- as.numeric(power$Global_active_power)
subMetering1 <- as.numeric(power$Sub_metering_1)
subMetering2 <- as.numeric(power$Sub_metering_2)
subMetering3 <- as.numeric(power$Sub_metering_3)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# creating ìthe png file

dev.copy(png, file = "plot3.png")

dev.off()