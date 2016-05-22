file <- "./household_power_consumption.txt"
data <- read.table(file,header=TRUE,sep=";",quote="",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
x <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-01"
y <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-02"
data2 <- data[x|y,]
data2$datetime <- strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
par(mfcol=c(1,1))
y <- c(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3)
plot(data2$datetime,y[1:2880],xlab="",ylab="Energy sub metering",type="n")
points(data2$datetime,y[1:2880],col="black",type="l")
points(data2$datetime,y[2881:5760],col="red",type="l")
points(data2$datetime,y[5761:8640],col="blue",type="l")
legend("topright", lty = c(1,1,1), 
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()