## This script creates the plot1.png

## Read whole text file into a big Data table:
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
           colClasses = c("character","character","numeric","numeric","numeric",
                          "numeric"  ,"numeric","numeric","numeric"), na.strings = "?")

## Open PNG device; create 'plot1.png' in my working directory
png(file = "plot1.png",width = 480, height = 480)                          

library(data.table)

## Convert to data.table
DT <- data.table(Data)
setkey(DT, Date)

## Extract days of interest using Date as key
DTofInt <- rbind(DT['1/2/2007'],DT['2/2/2007'])

## Create histogram with extracted data values
hist(DTofInt$Global_active_power, col = 'red', main = "Global Active Power", 
                                    xlab = "Global Active Power (kilowatts)" )

## Close Graphics Device.
dev.off()  