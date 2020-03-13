##Plot2

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

##Generate Plot
plot(d4$mastertime, d4$Global_active_power/1000, type = "line", xlab = "", ylab = "Global Active Power (kW)")
dev.copy(png, file = "Plot2.png")
dev.off()
