# calling the dplyr library 
library(dplyr) 
# reading the tx file 
power <-  read.table("household_power_consumption.txt",header = TRUE, sep = ";")
# subsetting for 1/02/2007 and 2/02/2007
power <- filter(power, Date == "1/2/2007"  |  Date == "2/2/2007")

# plotting

datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

activepower <- as.numeric(power$Global_active_power)

plot(datetime, activepower, type="l", xlab="Day of the week", ylab="Global Active Power (kilowatts)")

# creating ìthe png file

dev.copy(png, file = "plot2.png")

dev.off()