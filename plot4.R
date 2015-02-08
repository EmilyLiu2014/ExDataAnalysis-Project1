####
# Plot 4
####
library(sqldf)

## 2880 obs. and 9 vars.
hh_power <- read.csv.sql("./household_power_consumption.txt", header=TRUE,sep=";",
                         sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

plot4 <- subset(hh_power, hh_power$Date != "?" & hh_power$Time != "?" &
                    as.character(hh_power$Sub_metering_1) != "?" & 
                    as.character(hh_power$Sub_metering_2) != "?" &
                    as.character(hh_power$Sub_metering_3) != "?" &
                    as.character(Global_active_power) != "?" &
                    as.character(Global_reactive_power) != "?" &
                    as.character(Voltage) != "?" )
plot4$Date_Time <- strptime(paste(plot4$Date, plot4$Time), "%d/%m/%Y %H:%M:%S")

png(filename="./plot4.png", width=480, height=480, units="px")
par(mfrow = c(2,2))
par(mar = c(4, 4, 2, 2))
with(plot4, {
    plot(Date_Time, Global_active_power, xlab="", ylab="Global Active Power", type="l")
    plot(Date_Time, Voltage, xlab="datetime", ylab="Voltage", type="l")
    with(plot4, plot(Date_Time, Sub_metering_1, type="n", xlab="",
                     ylab="Engergy sub metering"))
    with(plot4, points(Date_Time, Sub_metering_1, col="black", type="l"))
    with(plot4, points(Date_Time, Sub_metering_2, col="red", type = "l"))
    with(plot4, points(Date_Time, Sub_metering_3, col="blue", type="l"))
    legend("topright", pch = "---",  col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Date_Time, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l" )
})
dev.off()