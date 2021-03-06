library(dplyr)
library(lubridate)

# read data from txt file, only the first 100.000 to make it faster
hpc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=100000)

# convert the Date and Time column to real date/time format
# using lubridate package that might be too robust but anyway...
hpc$Date <- dmy(hpc$Date)
hpc$Time <- hms (hpc$Time)

# filter only the 2 days that we need
hpc_2days <- filter (hpc, Date == "2007-02-01" | Date == "2007-02-02" )

# create the plot and save into a PNG file
png(filename = "plot1.png", width = 480, height = 480)
hist(hpc_2days$Global_active_power, col = "red", xlab= "Global Active Power (kilowatts)", main = "Global Active Power")
title(xlab= "Global Active Power (kilowatts)")
dev.off()





