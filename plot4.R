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
png(filename = "plot4.png")

## Change mfcol parameter to create 4 plots in 1 in 2x2 format
par(mfcol = c(2, 2))

## Add first plot
plot(power_data1$Date_Time, power_data1$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## Add second plot
with(power_data1, plot(Date_Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(power_data1$Date_Time, power_data1$Sub_metering_2, col = "red")
lines(power_data1$Date_Time, power_data1$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Add third plot
plot(power_data1$Date_Time, power_data1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## Add fourth plot
plot(power_data1$Date_Time, power_data1$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

## End plotting device
dev.off()
