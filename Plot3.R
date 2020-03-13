##prepare data same as for other plots
d1<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
head(d1)
library(dplyr)

d3<- filter(d1, Date == "1/2/2007"|Date == "2/2/2007")
rm(d1)
d4<-mutate(d3, Date1 = as.Date(Date, "%d/%m/%y"))
head(d4)
summary(d4)
d4$Global_active_power <- as.numeric(d4$Global_active_power)  
d4$mastertime <- strptime(paste(as.Date(d4$Date, "%d/%m/%y"), d4$Time), format = "%Y-%m-%d %H:%M:%S")

##Generate Plot3
par(mfrow = c(1,1))
View(d4)
plot(d4$mastertime, d4$Sub_metering_1, type = "line", col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(d4$mastertime, d4$Sub_metering_2, col = "red")
lines(d4$mastertime, d4$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), text.col = c("black", "red", "blue"))
dev.copy(png, file = "Plot3.png")
dev.off()
