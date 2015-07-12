# Project 1 - Plot 3

# Read in data from subfolder. Assumes this file is in the correct working directory.
household_power_consumption <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", 
                                        sep=";", 
                                        na.strings="?")

# Convert Date field to "Date" class
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

# Copy 2007-02-01 and 2007-02-02 data into new data frame
data1 <- rbind(household_power_consumption[household_power_consumption$Date == "2007-02-01",],
               household_power_consumption[household_power_consumption$Date == "2007-02-02",])

# Combine Date and Time field into "datetime" field
datetime <- strptime(paste(data1$Date, data1$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

# cbin datetime column into data
data1 <- cbind(datetime,
               data1)

# Open PNG device with file name
png(file = "plot3.png", width = 480, height = 480)

# Send plot to PNG device
# Create the plot without andy data
with(data1, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))

# Add individual lines separately, with different colors
with(data1, lines(datetime, Sub_metering_1, col = "black"))
with(data1, lines(datetime, Sub_metering_2, col = "red"))
with(data1, lines(datetime, Sub_metering_3, col = "blue"))

# Create legend with corresponding colors and tags
legend("topright", 
       lwd = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close PNG file device
dev.off()

# File with correct name is created in CWD
