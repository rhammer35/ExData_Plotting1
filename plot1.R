## Reads data into data frame from intial txt file in working directory
power_data <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses = "character")

## Converts data in column to date class
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

## Subsets data into desired dataset
power_data1 <- subset(power_data, Date == '2007-02-01' | Date == '2007-02-02')

