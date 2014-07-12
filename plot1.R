datasetFULL <- read.table("household_power_consumption.txt", header=T, sep=";", 
                          comment.char = "", colClasses = "character")
datasetSEL <- subset(datasetFULL,datasetFULL$Date=="1/2/2007" | 
                                        datasetFULL$Date == "2/2/2007")
datasetSEL$Global_active_power <- as.numeric(datasetSEL$Global_active_power)


png("plot1.png", width=480, height=480)
print(hist(datasetSEL$Global_active_power, 
     col="red", 
     ylim=c(0,1200),
     main="Global Active Power",
     xlab="Global Active Power (kilowats)"))
dev.off()