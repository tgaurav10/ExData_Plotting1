library(lubridate)
data <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header=T, nrows=10)
names <- colnames(data)
library(lubridate)
d1 <- dmy_hms(paste(data[1,1], data[1,2], sep=" "))
d2 <- ymd_hms("2007/02/01 00:00:00")
n= as.numeric((d2-d1)*1440)
data <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", col.names= names, skip=n+1, nrows=2880, na.strings="?")
data <- cbind(strptime(x=paste(data[,1],data[,2],sep=" "), format= "%d/%m/%Y %H:%M:%S"),data)
png(filename="plot1.png", height=480, width=480, 
    bg="white")
hist(data[,4], col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off();
