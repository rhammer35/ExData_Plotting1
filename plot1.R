## Reads data into data frame from intial txt file in working directory

power_data <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

## Converts data in Date and Time columns to single column with date and time class
power_data$Date <- as.Date(power_data$Date)
power_data$Time <- strptime(power_data$Time, "%H:%M:%S")

