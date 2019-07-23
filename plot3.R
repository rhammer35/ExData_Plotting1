## Reads data into data frame from intial txt file in working directory
power_data <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses = "character")

## Creates column combining date and time as a one variable character string
power_data$Date_Time <- paste(power_data$Date, power_data$Time, sep = " ")

## Converts data in Date column to date class
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

## Subsets data into desired dataset
power_data1 <- subset(power_data, Date == '2007-02-01' | Date == '2007-02-02')

## Converts data in Date_Time column to POSIXlt class
power_data1$Date_Time <- strptime(power_data1$Date_Time, format = "%d/%m/%Y %H:%M:%S")

## Initialize png plotting device
png(filename = "plot3.png")

## Create line graph with given characteristics of sub_metering_1 to match example in assignment
with(power_data1, plot(Date_Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))

## Add sub_metering_2 and sub_metering_3 to existing graph
lines(power_data1$Date_Time, power_data1$Sub_metering_2, col = "red")
lines(power_data1$Date_Time, power_data1$Sub_metering_3, col = "blue")

## Add legend to graph
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## End plotting device
dev.off()