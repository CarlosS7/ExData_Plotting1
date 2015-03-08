hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")
png(filename = "plot3.png", height = 480, units = "px")
plot(hpc_s$DateTime, hpc_s$Sub_metering_1, type="l", xlab = NA,  ylab = "Energy sub metering")
lines(hpc_s$DateTime, hpc_s$Sub_metering_2, col = 2, type="l")
lines(hpc_s$DateTime, hpc_s$Sub_metering_3, col = 4, type="l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty = c(1,1,1),
lwd=c(1,1,1), col=c("black", "red","blue"))
dev.off()