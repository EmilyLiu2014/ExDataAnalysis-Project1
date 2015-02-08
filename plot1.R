#####
# Plot 1
#####
library(sqldf)

## 2880 obs. and 9 vars.
hh_power <- read.csv.sql("./household_power_consumption.txt", header=TRUE,sep=";",
                         sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
plot1 <- subset(hh_power, as.character(hh_power$Global_active_power) != "?")
    
png(filename="./plot1.png", width=480, height=480, units="px")
hist(plot1$Global_active_power, main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", col="red")
#dev.copy(png, filename="./plot1.png", width=480, height=480, units="px")
dev.off()