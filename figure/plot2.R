power <- read.table(
    "household_power_consumption.txt",
    header=FALSE,sep=";",skip=66637,
    nrows=2879)
names(power) <- c(
    "Date","Time","Global_active_power",
    "Global_reactive_power","Voltage",
    "Global_intensity","Sub_metering_1",
    "Sub_metering_2","Sub_metering_3")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")
power$datetime <- paste(as.character(power$Date),
                        as.character(power$Time))
power$datetime <- strptime(power$datetime,
                           format = "%Y-%m-%d %H:%M:%S")
windows()
plot(power$datetime,power$Global_active_power,
     type="l",ylab="Global Active Power (kilowatts)",
     xlab = "")
dev.copy(png, file="plot2.png")
dev.off()