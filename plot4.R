library(lubridate)
data <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header=T, nrows=10)
names <- colnames(data)
library(lubridate)
d1 <- dmy_hms(paste(data[1,1], data[1,2], sep=" "))
d2 <- ymd_hms("2007/02/01 00:00:00")
n= as.numeric((d2-d1)*1440)
data <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", col.names= names, skip=n+1, nrows=2880, na.strings="?")
data <- cbind(strptime(x=paste(data[,1],data[,2],sep=" "), format= "%d/%m/%Y %H:%M:%S"),data)
png(filename="plot4.png", height=480, width=480, 
    bg="white")

par(mfcol=c(2,2))
par(mar=c(2,4,1,1))

plot(data[,1],data[,4], type="n",xlab="", ylab="Global Active Power", cex.lab=0.8)
lines(data[,1],data[,4])

plot(data[,1],data[,8], type="n", xlab="", ylab="Energy sub metering", ylim= c(0,50), cex.lab=0.8)
lines(data[,1],data[,8])
lines(data[,1],data[,9],col="red")
lines(data[,1],data[,10],col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), cex=0.8)

plot(data[,1],data[,6], type="n",xlab="datetime", ylab="Voltage", cex.lab=0.8)
lines(data[,1],data[,6])

plot(data[,1],data[,5], type="n",xlab="datetime", ylab="Global_Reactive_Power", cex.lab=0.8)
lines(data[,1],data[,5])

dev.off()