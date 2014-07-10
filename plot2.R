### Loading the Data

file = 'household_power_consumption.txt'
ds<-read.csv2(file, header = TRUE, sep = ";", quote = "\"")
head(ds)
str(ds)
ds$dateTime <- strptime(paste(ds$Date,  ds$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Change to Date Time Format
startDate <- strptime("01/02/2007 00:00:00" , format = "%d/%m/%Y %H:%M:%S")
endDate <- strptime("02/02/2007 23:59:59" , format = "%d/%m/%Y %H:%M:%S")
baseDs <- ds[((ds$dateTime>=startDate) & (ds$dateTime<=endDate)),]
baseDs$Global_active_power<-as.numeric(levels(baseDs$Global_active_power)[baseDs$Global_active_power])

# Convert from factor to numeric
baseDs$Sub_metering_1<-as.numeric(levels(baseDs$Sub_metering_1)[baseDs$Sub_metering_1])
baseDs$Sub_metering_2<-as.numeric(levels(baseDs$Sub_metering_2)[baseDs$Sub_metering_2])
baseDs$Sub_metering_3<-as.numeric(levels(baseDs$Sub_metering_3)[baseDs$Sub_metering_3])
baseDs$Voltage<-as.numeric(levels(baseDs$Voltage)[baseDs$Voltage])
baseDs$Global_reactive_power<-as.numeric(levels(baseDs$Global_reactive_power)[baseDs$Global_reactive_power])

### Plot 2: Global Active Power (Scatter Plot)
png(file="plot2.png",width=480, height=480)
with(baseDs, plot(x= dateTime, y = Global_active_power, type='l', ylab="Global Active Power (kilowatts)"))
dev.off()

