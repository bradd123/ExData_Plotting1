# Path to the source file
dataFile <- "./data/household_power_consumption.txt"

# Read data from the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Take data of only two dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# take date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# take global active power
globalActivePower <- as.numeric(subSetData$Global_active_power)

# store plot in png format
png("plot2.png", width=480, height=480)

# Generate plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the connection
dev.off()