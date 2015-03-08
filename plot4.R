
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")
png(filename = "plot4.png", height = 480, units = "px")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,0,0))
with(hpc_s, {
        plot(hpc_s$DateTime, hpc_s$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power")
        plot(hpc_s$DateTime, hpc_s$Voltage, xlab = "datetime", ylab = "Voltage", type="l")
        plot(hpc_s$DateTime, hpc_s$Sub_metering_1, type="l", xlab = NA,  ylab = "Energy sub metering")
        lines(hpc_s$DateTime, hpc_s$Sub_metering_2, col = 2, type="l")
        lines(hpc_s$DateTime, hpc_s$Sub_metering_3, col = 4, type="l")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                         lty = c(1,1,1),
                         lwd=c(0.5,0.5,0.5), col=c("black", "red","blue"), bty = "n", pt.cex = 1, cex =0.7)
         plot(hpc_s$DateTime, hpc_s$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")})
dev.off()