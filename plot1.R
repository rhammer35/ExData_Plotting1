## Reads data into data frame from intial txt file in working directory
power_data <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses = "character")

## Converts data in Date column to date class
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

## Subsets data into desired dataset
power_data1 <- subset(power_data, Date == '2007-02-01' | Date == '2007-02-02')

## Initialize png plotting device
png(filename = "plot1.png")

## Create histogram with given characteristics to match example in assignment
hist(as.numeric(power_data1$Global_active_power), xlab = "Global Active Power (kilowatts", col = "Red", main = "Global Active Power")

## End plotting device
dev.off()

