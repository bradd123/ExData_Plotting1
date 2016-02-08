# path to the file
dataFile <- "./data/household_power_consumption.txt"

# load data from the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# take only two days data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# for global active power
globalActivePower <- as.numeric(subSetData$Global_active_power)

# for sub_metering_1
subMetering1 <- as.numeric(subSetData$Sub_metering_1)

# for sub_metering_2
subMetering2 <- as.numeric(subSetData$Sub_metering_2)

# for sub_metering_3
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# store output in png format
png("plot3.png", width=480, height=480)

# Generate plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

# for legends in top right corner
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# close the connection
dev.off()