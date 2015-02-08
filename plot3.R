#####
# Plot 3
#####
library(sqldf)

## 2880 obs. and 9 vars.
hh_power <- read.csv.sql("./household_power_consumption.txt", header=TRUE,sep=";",
                         sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

plot3 <- subset(hh_power, as.character(hh_power$Sub_metering_1) != "?" & 
                    as.character(hh_power$Sub_metering_2) != "?" &
                    as.character(hh_power$Sub_metering_3) != "?" &
                    hh_power$Date != "?" & hh_power$Time != "?" )
plot3$Date_Time <- strptime(paste(plot3$Date, plot3$Time), "%d/%m/%Y %H:%M:%S")

png(filename="./plot3.png", width=480, height=480, units="px")
with(plot3, plot(Date_Time, Sub_metering_1, type="n", xlab="",
                 ylab="Engergy sub metering"))
with(plot3, points(Date_Time, Sub_metering_1, col="black", type="l"))
with(plot3, points(Date_Time, Sub_metering_2, col="red", type = "l"))
with(plot3, points(Date_Time, Sub_metering_3, col="blue", type="l"))
legend("topright", pch = "-",  col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, filename="./plot3.png", width=480, height=480, units="px")
dev.off()

