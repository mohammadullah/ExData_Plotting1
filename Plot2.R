
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

png(file="Plot2.png",width=480,height=480)

## Create the plot

plot(power_data$datetime, power_data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", xlab = NA, type = "l")

## Close the device

dev.off()
