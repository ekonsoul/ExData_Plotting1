
# Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
#           colClasses = c("character","character","numeric","numeric","numeric",
#                          "numeric", "numeric","numeric","numeric"), na.strings = "?")

png(file = "plot2.png",width = 480, height = 480) ## Open PNG device; create 'plot2.png' in my working directory

library(data.table)

DT <- data.table(Data)
setkey(DT, Date)

DTofInt <- rbind(DT['1/2/2007'],DT['2/2/2007'])

# Create Time Axis
z2<-paste(DTofInt$Date,DTofInt$Time)
# Read Time Strings in POSIXlt time format.
Time <- strptime(z2, "%d/%m/%Y%H:%M:%S")

plot(Time, DTofInt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()