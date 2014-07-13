## Read the data

datasetFULL <- read.table("household_power_consumption.txt", header=T, sep=";", 
                          comment.char = "", colClasses = "character")
datasetSEL <- subset(datasetFULL,datasetFULL$Date=="1/2/2007" | 
                             datasetFULL$Date == "2/2/2007")
datasetSEL$Sub_metering_1 <- as.numeric(datasetSEL$Sub_metering_1)
datasetSEL$Sub_metering_2 <- as.numeric(datasetSEL$Sub_metering_2)
datasetSEL$Sub_metering_3 <- as.numeric(datasetSEL$Sub_metering_3)
datasetSEL$Global_active_power <- as.numeric(datasetSEL$Global_active_power)
datasetSEL$Voltage <- as.numeric(datasetSEL$Voltage)


## Define the peramaters to plot in two rows and columns
png("plot4.png", width=480, height=480)
print(par( mfrow = c( 2, 2 ) ))

## Plot 1: Global Active Power

plot(datasetSEL$Global_active_power, type="l", 
     ylab="Global Active Power (kilowats)", xlab="")


## Plot 2: Voltage

plot(datasetSEL$Voltage, type="l", 
     ylab="Voltage", xlab="")


## Plot 3: Energy sub metering

plot(datasetSEL$Sub_metering_1, type="s", ylab="Energy sub metering",xlab="")
lines(datasetSEL$Sub_metering_2, type="s", col="red")
lines(datasetSEL$Sub_metering_3, type="s", col="blue")
legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       pch="-", col=c("black", "red", "blue"))

## Plot 4: Global Reactive Power

plot(datasetSEL$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="")
