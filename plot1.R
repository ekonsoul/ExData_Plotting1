
# Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
#           colClasses = c("character","character","numeric","numeric","numeric",
#                          "numeric"  ,"numeric","numeric","numeric"), na.strings = "?")

png(file = "plot1.png",width = 480, height = 480) ## Open PNG device; create 'plot1.png' in my working directory                         

library(data.table)

DT <- data.table(Data)
setkey(DT, Date)

DTofInt <- rbind(DT['1/2/2007'],DT['2/2/2007'])

hist(DTofInt$Global_active_power, col = 'red', main = "Global Active Power", 
                                    xlab = "Global Active Power (kilowatts)" )

dev.off()  # Close Graphics Device.