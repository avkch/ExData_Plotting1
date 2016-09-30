# read the data file
alldata <- read.table("household_power_consumption.txt", 
                     header = T, 
                     sep = ";", 
                     na.strings = "?", 
                     stringsAsFactors = F)

# subset the data used for the graphs
useddata <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
# converts time a nd data columns to datatime and puts the result in a new DT column 
useddata$DT <- strptime(paste(useddata$Time, useddata$Date), "%H:%M:%S %d/%m/%Y")

# turning the png device on
png(filename = "plot4.png")
# preparing the frame 2 rows, 2 columns
par(mfrow = c(2, 2))
# plot the first graph
plot(useddata$DT, 
     useddata$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")
# plot the second graph
plot(useddata$DT, 
     useddata$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")
# ploting the third graph
# asigning columns to variables
x <- useddata$DT
y1 <- useddata$Sub_metering_1
y2 <- useddata$Sub_metering_2
y3 <- useddata$Sub_metering_3
# plot the graph
plot(x, y1, type = "n", xlab = "", ylab = "Energy Sub metering")
# put lines on the graph
lines(x, y1)
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
# put legend on the graph
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",
       col=c("black","red","blue"), 
       lty = c(1, 1, 1))
# plotting the fourth graph
plot(useddata$DT, 
     useddata$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")
# turning the png device off
dev.off()