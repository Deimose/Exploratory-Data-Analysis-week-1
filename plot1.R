#plot1.png


electric<-read.table("household_power_consumption.txt", skip=1,sep=";")
names(electric)<-c("Date", "Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )


electric<-subset(electric,electric$Date=="1/2/2007"|electric$Date=="2/2/2007")
electric$Date<-as.Date(electric$Date)
electric$Global_active_power<-as.numeric(as.character(electric$Global_active_power))
electric$Sub_metering_1<-as.numeric(as.character(electric$Sub_metering_1))
electric$Voltage<-as.numeric(as.character(electric$Voltage))
electric$Global_reactive_power<-as.numeric(as.character(electric$Global_reactive_power))


png("plot1.png")
hist(electric$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power(kilowatts")
dev.off()   