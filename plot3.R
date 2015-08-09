# Load data
data<-read.delim("household_power_consumption.txt",header=TRUE,na.strings = c("?"),sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# convert string date to Date
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Date2 <- strptime(paste(data$Date,data$Time,sep=" "),"%Y-%m-%d %T")

#subset data for days interested in
subdata<-data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

png(filename = "plot3.png",width = 480,height = 480)

#plot
xrange<-range(subdata$Date2)
yrange<-range(subdata$Sub_metering_1)
plot(xrange,yrange,type="n",ylab="Energy sub metering",xlab="")

#add lines
lines(subdata$Date2,subdata$Sub_metering_1,type="l",col="black")
lines(subdata$Date2,subdata$Sub_metering_2,type="l",col="red")
lines(subdata$Date2,subdata$Sub_metering_3,type="l",col="blue")

#add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
#save
dev.off()