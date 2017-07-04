
## Read data table from 01/02/2007 to 02/02/2007

power_data <- read.table("household_power_consumption.txt", 
                         col.names = colnames(read.table("household_power_consumption.txt", 
                                                         nrow = 1, header = TRUE, sep = ";")), skip = 66637, nrows = 2880, 
                         sep = ";", na.strings = "?", stringsAsFactors=FALSE)

##Make a new column contaning date and time together 
##and convert to POSIXct 

power_data$datetime <- with(power_data, as.POSIXct(paste(Date, Time), 
                                                   format = "%d/%m/%Y %H:%M:%S"))

## Open and create png file

png(file="Plot4.png",width=480,height=480)

## Set the parameters for 4 plots

par(mfrow = c(2,2), mar = c(4, 4, 2, 2))

## First plot (using line) 

plot(power_data$datetime, power_data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", xlab = NA, type = "l")

## Second Plot (using line)

plot(power_data$datetime, power_data$Voltage, ylab = "Voltage",
     xlab = "datetime", type ="l")

## Third plot

plot(power_data$datetime, power_data$Sub_metering_1, 
     xlab = NA, ylab = "Energy sub metering", type = "n")
lines(power_data$datetime, power_data$Sub_metering_1)
lines(power_data$datetime, power_data$Sub_metering_2, col = "red")
lines(power_data$datetime, power_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
      "Sub_metering_3"), lty = c(1,1,1), bty = "n", col=c("black","red", "blue"))

## Fourth plot (using line)

plot(power_data$datetime, power_data$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "l")

## Close the device

dev.off()
