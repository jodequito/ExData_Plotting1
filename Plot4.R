##Plot 4
d3<- filter(d1, Date == "1/2/2007"|Date == "2/2/2007")
rm(d1)
d4<-mutate(d3, Date1 = as.Date(Date, "%d/%m/%y"))
head(d4)
summary(d4)
d4$Global_active_power <- as.numeric(d4$Global_active_power)  
d4$mastertime <- strptime(paste(as.Date(d4$Date, "%d/%m/%y"), d4$Time), format = "%Y-%m-%d %H:%M:%S")

##Generate Plot4
windows()
par(mfrow = c(2,2))
par(mar = c(5,3,3,3))
plot(d4$mastertime,d4$Global_active_power, type = "line", xlab = "", ylab = "Global Active Power")
plot(d4$mastertime, d4$Voltage, type = "line", xlab = "Daytime", ylab = "Voltage")
plot(d4$mastertime, d4$Sub_metering_1, type = "line", col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(d4$mastertime, d4$Sub_metering_2, col = "red")
lines(d4$mastertime, d4$Sub_metering_3, col = "blue")
legend("topright", legend = c("SubMeter1", "SubMeter2", "SubMeter3"), text.col = c("black", "red", "blue"), xjust = 5)
plot(d4$mastertime, d4$Global_reactive_power, type = "line", xlab = "datetime", ylab = "Global Reactive Power")
dev.copy(png, file = "Plot4.png")
dev.off()

