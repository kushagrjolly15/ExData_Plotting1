file <-'./household_power_consumption.txt'
data <- read.table(file,header=TRUE,sep=";",quote="",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
x <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-01"
y <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-02"
data2 <- data[x|y,]
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(data2$Global_active_power,col="orangered",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()