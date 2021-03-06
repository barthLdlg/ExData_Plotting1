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
globalActive <- as.numeric(elec$Global_active_power)

##draw the plot
hist(globalActive, col = "red", main="Global Active Power",xlab = "Global Active Power (kilowatts)")

##save the plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


