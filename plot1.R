# Load data
data<-read.delim("household_power_consumption.txt",header=TRUE,na.strings = c("?"),sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# convert string date to Date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset data for days interested in
subdata<-data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

png(filename = "plot1.png",width = 480,height = 480)

# Draw hist
hist(subdata$Global_active_power,col="red",main="Global Avtive Power",xlab = "Global Active Power (kilowatts)")

#save plot
dev.off()