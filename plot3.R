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
plot(elec$Time, elec$Sub_metering_1, type = "l", xlab = "", ylab="Global Active Power (kilowatts)", col = "black")
lines(elec$Time, elec$Sub_metering_2, type = "l", xlab = "", col ="red")
lines(elec$Time, elec$Sub_metering_3, type = "l", xlab = "", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##save the plot
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
