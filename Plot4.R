##############################
##
## Course Project 1 - Plot4.R
##
##############################

dt <- read.table("C:/R/Week1_Project1/household_power_consumption.txt", sep=";",header = TRUE,colClasses = "character")

dt <- subset(dt,Date == "01/02/2006"|Date =="02/02/2006"|Date == "1/2/2007"|Date =="2/2/2007")

dt$Time <- strptime(paste(dt$Date, dt$Time),"%d/%m/%Y %H:%M:%S")
dt$Date <- strptime(dt$Date,"%d/%m/%Y")

dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Voltage <- as.numeric(dt$Voltage)
dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)

par(mfrow = c(2,2))

plot(dt$Time, dt$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(dt$Time, dt$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(dt$Time, dt$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dt$Time, dt$Sub_metering_2,col="red")
lines(dt$Time, dt$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), adj=0)

plot(dt$Time, dt$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, file="C:/R/Week1_Project1/Plot4.png")
dev.off()
