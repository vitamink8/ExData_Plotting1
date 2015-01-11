#load necessary libraries
library(data.table)

#subset data by dates
allData <- fread("household_power_consumption.txt")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")
subData <- allData[allData$Date >= "2007-02-01" 
                   & allData$Date <= "2007-02-02", ]

#convert date format, create new column for date/time
subData$POSIXdate <- as.Date(subData$Date, format="%d/%m/%Y")
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), 
                               format="%Y-%m-%d %H:%M:%S")



png(file = "plot3.png", width=480, height=480)

esm1 <- as.numeric(subData$Sub_metering_1)
esm2 <- as.numeric(subData$Sub_metering_2)
esm3 <- as.numeric(subData$Sub_metering_3)
plot(subData$DateTime, esm1, type="l", xlab="", 
     ylab="Energy sub metering")
lines(subData$DateTime, esm2, type="l", col="red")
lines(subData$DateTime, esm3, type="l", col="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"), 
       lty=c(1, 1, 1), pch="", lwd=1, 
       col=c("black", "red", "blue"))

dev.off()