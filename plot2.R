## Reads data into data frame from intial txt file in working directory
power_data <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses = "character")

## Converts data in column to date class
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

## Subsets data into desired dataset
power_data1 <- subset(power_data, Date == '2007-02-01' | Date == '2007-02-02')

## Initialize png plotting device
png(filename = "plot2.png")

## Create histogram with given characteristics to match example in assignment
plot(power_data1$Date, power_data2$Global_active_power, type = "l")

## End plotting device
dev.off()

