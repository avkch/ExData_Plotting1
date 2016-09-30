# read the data file
alldata <- read.table("household_power_consumption.txt", 
                      header = T, 
                      sep = ";", 
                      na.strings = "?", 
                      stringsAsFactors = F)

# subset the data used for the graphs
useddata <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

# turning the png device on
png(filename = "plot1.png")
# plot the graph
hist(useddata$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
# turning the png device off
dev.off()