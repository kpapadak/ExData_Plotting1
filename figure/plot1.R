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
par(bg='white')
hist(power$Global_active_power,
     col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.copy(png, file="plot1.png")
dev.off()