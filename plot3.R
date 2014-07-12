datasetFULL <- read.table("household_power_consumption.txt", header=T, sep=";", 
                          comment.char = "", colClasses = "character")
datasetSEL <- subset(datasetFULL,datasetFULL$Date=="1/2/2007" | 
                             datasetFULL$Date == "2/2/2007")
datasetSEL$Sub_metering_1 <- as.numeric(datasetSEL$Sub_metering_1)
datasetSEL$Sub_metering_2 <- as.numeric(datasetSEL$Sub_metering_2)
datasetSEL$Sub_metering_3 <- as.numeric(datasetSEL$Sub_metering_3)

png("plot3.png", width=480, height=480)
print(plot(datasetSEL$Sub_metering_1, type="s", ylab="Energy sub metering",xlab=""))
lines(datasetSEL$Sub_metering_2, type="s", col="red")
lines(datasetSEL$Sub_metering_3, type="s", col="blue")
legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       pch="-", col=c("black", "red", "blue"))
dev.off()