##############################
##
## Course Project 1 - Plot1.R
##
##############################

dt <- read.table("C:/R/Week1_Project1/household_power_consumption.txt", sep=";",header = TRUE,colClasses = "character")

dt <- subset(dt,Date == "01/02/2006"|Date =="02/02/2006"|Date == "1/2/2007"|Date =="2/2/2007")

dt$Time <- strptime(paste(dt$Date, dt$Time),"%d/%m/%Y %H:%M:%S")
dt$Date <- strptime(dt$Date,"%d/%m/%Y")

dt$Global_active_power <- as.numeric(dt$Global_active_power)

hist(dt$Global_active_power, col="red", main="Global Active Power",xlab="Gloval_active_power (Kilowatts)")

dev.copy(png, file="C:/R/Week1_Project1/Plot1.png")
dev.off()
