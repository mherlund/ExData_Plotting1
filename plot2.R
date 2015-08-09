# Load data
data<-read.delim("household_power_consumption.txt",header=TRUE,na.strings = c("?"),sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# convert string date to Date
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Date2 <- strptime(paste(data$Date,data$Time,sep=" "),"%Y-%m-%d %T")

#subset data for days interested in
subdata<-data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

png(filename = "plot2.png",width = 480,height = 480)
#plot
plot(subdata$Date2,subdata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#save

dev.off()