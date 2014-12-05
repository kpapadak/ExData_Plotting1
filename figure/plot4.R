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
par(mfrow=(c(2,2)))
plot(power$datetime,power$Global_active_power,
     type="l",ylab="Global Active Power (kilowatts)",
     xlab = "")
plot(power$datetime,power$Voltage,type="l",xlab="datetime",
     ylab="Voltage")
plot(power$datetime,power$Sub_metering_1,type="l",
     col="black",xlab="",ylab="Energy sub metering")
points(power$datetime,power$Sub_metering_2,type="l",
       col="red")
points(power$datetime,power$Sub_metering_3,type="l",
       col="blue")
legend("topright",bty="n",legend=c('Sub_metering_1',
       'Sub_metering_2','Sub_metering_3'),col=c('black','red',
        'blue'),cex=0.8,lwd=1)
plot(power$datetime,power$Global_reactive_power,xlab="datetime",
     ylab="Global_reactive_power",type="l")
dev.copy(png, file = "plot4.png")
dev.off()