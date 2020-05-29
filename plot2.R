
#plot2.png

electric<-read.table("household_power_consumption.txt", skip=1,sep=";")
names(electric)<-c("Date", "Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )


electric<-subset(electric,electric$Date=="1/2/2007"|electric$Date=="2/2/2007")
electric$Date<-as.Date(electric$Date)
electric$Global_active_power<-as.numeric(as.character(electric$Global_active_power))
electric$Sub_metering_1<-as.numeric(as.character(electric$Sub_metering_1))
electric$Voltage<-as.numeric(as.character(electric$Voltage))
electric$Global_reactive_power<-as.numeric(as.character(electric$Global_reactive_power))
electric$Time<-strptime(electric$Time,format="%H:%M:%S")
electric[1:1440,"Time"]<-format(electric[1:1440,"Time"],"2007-02-01 %H:%M:%S")
electric[1441:2880,"Time"]<-format(electric[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

 
png("plot2.png")
plot(electric$Time,electric$Global_active_power,type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off() 
