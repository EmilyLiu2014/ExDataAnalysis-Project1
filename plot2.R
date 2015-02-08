#####
# Plot 2
#####
library(sqldf)

## 2880 obs. and 9 vars.
hh_power <- read.csv.sql("./household_power_consumption.txt", header=TRUE,sep=";",
                         sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
plot2 <- subset(hh_power, as.character(hh_power$Global_active_power) != "?" & hh_power$Date != "?"
                & hh_power$Time != "?", select = c(1,2,3))
plot2$Date_Time <- strptime(paste(plot2$Date,plot2$Time), "%d/%m/%Y %H:%M:%S")

png(filename="./plot2.png", width=480, height=480, units="px")
par(mar=c(4,4,2,2))
plot(plot2$Date_Time, plot2$Global_active_power, type="l", xlab ="", 
     ylab="Global Active Power (kilowatts)")
#dev.copy(png, filename="./plot2.png", width=480, height=480, units="px")
dev.off()