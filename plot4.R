## This script creates the plot4.png

## Read whole text file into a big Data table:
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   colClasses = c("character","character","numeric","numeric","numeric",
                                  "numeric", "numeric","numeric","numeric"), na.strings = "?")

## Open PNG device; create 'plot4.png' in my working directory
png(file = "plot4.png",width = 480, height = 480) 

library(data.table)

## Convert to data.table
DT <- data.table(Data)
setkey(DT, Date)

## Extract days of interest using Date as key
DTofInt <- rbind(DT['1/2/2007'],DT['2/2/2007'])

## Create Time Axis
z2<-paste(DTofInt$Date,DTofInt$Time)

## Read Time Strings in POSIXlt time format.
Time <- strptime(z2, "%d/%m/%Y%H:%M:%S")

## Create a 2X2 table of subplots: 
par(mfrow = c(2, 2));

with(DTofInt, {
  
  ## Create Time Axis
  z2<-paste(DTofInt$Date,DTofInt$Time)
  
  ## Read Time Strings in POSIXlt time format.
  Time <- strptime(z2, "%d/%m/%Y%H:%M:%S")
  
  plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Time, Voltage, type = "l", xlab = "", ylab = "Voltage")
  
  ## Create composite subplot No.3 using "with" command.
  with(DTofInt, {
    ## Create Time Axis for subplot
    z2<-paste(DTofInt$Date,DTofInt$Time)
    
    ## Read Time Strings in POSIXlt time format.
    Time <- strptime(z2, "%d/%m/%Y%H:%M:%S")
    
    plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0,38), col = "black");
    par(new = TRUE)
    plot(Time, Sub_metering_2, type = "l", xlab = "", ylab = "", ylim = c(0,38), col = "red");
    par(new = TRUE)
    plot(Time, Sub_metering_3, type = "l", xlab = "", ylab = "", ylim = c(0,38), col = "blue")
  })
    ## Annotate subplot No.3 with legend 
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 " ), 
            , bty = "n", y.intersp = 0.75)
  
    plot(Time, Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power")
  
})

## Close the PNG file device
dev.off() 

