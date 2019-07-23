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
png(filename = "plot2.png")

## Create line graph with given characteristics to match example in assignment
plot(power_data1$Date_Time, power_data1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## End plotting device
dev.off()

