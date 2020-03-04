##load library data.table
library(data.table)

##load the data
elec<- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")

##filter on the two first days of February 2007
elec <- elec[(elec$Date=="1/2/2007" | elec$Date=="2/2/2007" ),]

##format the data
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")
realTime <- paste(elec$Date, elec$Time)
elec$Time <- strptime(realTime, format = "%Y-%m-%d %H:%M:%S")

#draw the plot
par(mfrow = c(2, 2))
plot(x = elec$Time, y = elec$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(x = elec$Time, y = elec$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x = elec$Time, y = elec$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = elec$Time, y = elec$Sub_metering_2, type = "l", col = "red")
lines(x = elec$Time, y = elec$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x = elec$Time, y = elec$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##save the plot
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

