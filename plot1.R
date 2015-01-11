#load necessary libraries
library(data.table)

#subset data by dates
allData <- fread("household_power_consumption.txt")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")
subData <- allData[allData$Date >= "2007-02-01" 
                   & allData$Date <= "2007-02-02", ]

#create histogram

png(file = "plot1.png", width=480, height=480)

gap <- as.numeric(subData$Global_active_power)
hist(gap, col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.off()
