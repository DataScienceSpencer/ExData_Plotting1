datasetFULL <- read.table("household_power_consumption.txt", header=T, sep=";", 
                          comment.char = "", colClasses = "character")
datasetSEL <- subset(datasetFULL,datasetFULL$Date=="1/2/2007" | 
                             datasetFULL$Date == "2/2/2007")
datasetSEL$Global_active_power <- as.numeric(datasetSEL$Global_active_power)
datasetSEL$Date <- as.Date(datasetSEL$Date, "%d/ %m/ %Y")
datasetSEL$Day <- weekdays(datasetSEL$Date)

png("plot2.png", width=480, height=480)
print(plot(datasetSEL$Global_active_power, type="l", 
           ylab="Global Active Power (kilowats)", xlab=""))
dev.off()
