hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")
png(filename = "plot2.png", height = 480, units = "px")
plot(hpc_s$DateTime, hpc_s$Global_active_power, type ="l", xlab = NA, ylab="Global Active Power")
dev.off()