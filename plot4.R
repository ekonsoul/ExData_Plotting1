
# Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
#           colClasses = c("character","character","numeric","numeric","numeric",
#                          "numeric", "numeric","numeric","numeric"), na.strings = "?")

png(file = "plot4.png",width = 480, height = 480) ## Open PNG device; create 'plot4.png' in my working directory

library(data.table)

DT <- data.table(Data)
setkey(DT, Date)

DTofInt <- rbind(DT['1/2/2007'],DT['2/2/2007'])

# Create Time Axis
z2<-paste(DTofInt$Date,DTofInt$Time)
# Read Time Strings in POSIXlt time format.
Time <- strptime(z2, "%d/%m/%Y%H:%M:%S")

# Create a 2X2 table of subplots: 
par(mfrow = c(2, 2));

with(DTofInt, {
  
  # Create Time Axis
  z2<-paste(DTofInt$Date,DTofInt$Time)
  # Read Time Strings in POSIXlt time format.
  Time <- strptime(z2, "%d/%m/%Y%H:%M:%S")
  
  plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Time, Voltage, type = "l", xlab = "", ylab = "Voltage")
  
  with(DTofInt, {
    # Create Time Axis
    z2<-paste(DTofInt$Date,DTofInt$Time)
    # Read Time Strings in POSIXlt time format.
    Time <- strptime(z2, "%d/%m/%Y%H:%M:%S")
    
    plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0,38), col = "black");
    par(new = TRUE)
    plot(Time, Sub_metering_2, type = "l", xlab = "", ylab = "", ylim = c(0,38), col = "red");
    par(new = TRUE)
    plot(Time, Sub_metering_3, type = "l", xlab = "", ylab = "", ylim = c(0,38), col = "blue")
  })
   
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 " ), 
            , bty = "n", y.intersp = 0.75)
  
    plot(Time, Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power")
  
})

dev.off() ## Close the PNG file device

