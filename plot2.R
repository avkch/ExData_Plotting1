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
png(filename = "plot2.png")
# plot the graph
plot(useddata$DT, 
     useddata$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power(kilowatts)")
# turning the png device off
dev.off()