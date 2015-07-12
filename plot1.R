# Project 1 - Plot 1

# Read in data from subfolder. Assumes this file is in the correct working directory.
household_power_consumption <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", 
                                        sep=";", 
                                        na.strings="?")

# Convert Date field to "Date" class
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

# Copy 2007-02-01 and 2007-02-02 data into new data frame
data1 <- rbind(household_power_consumption[household_power_consumption$Date == "2007-02-01",],
               household_power_consumption[household_power_consumption$Date == "2007-02-02",])

# datetime <- paste(data1$Date, data1$Time, sep = " ")

# data1 <- cbind(datetime,
#               data1)

# Open PNG device with file name
png(file = "plot1.png", width = 480, height = 480)

# Send plot to PNG device
hist(data1$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "orangered3", 
     main = "Global Active Power")

# Close PNG file device
dev.off()

# File with correct name is created in CWD
