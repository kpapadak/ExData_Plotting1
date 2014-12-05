power <- read.table(
    "household_power_consumption.txt",
    header=FALSE,sep=";",skip=66637,
    nrows=2879)
names(power) <- c(
    "Date","Time","Global_active_power",
    "Global_reactive_power","Voltage",
    "Global_intensity","Sub_metering_1",
    "Sub_metering_2","Sub_metering_3")
windows()
plot(power$datetime,power$Sub_metering_1,type="l",
     col="black",xlab="",ylab="Energy sub metering")
points(power$datetime,power$Sub_metering_2,type="l",
       col="red")
points(power$datetime,power$Sub_metering_3,type="l",
       col="blue")
dev.copy(png, file="plot3.png")
dev.off()

