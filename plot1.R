# Path to the source file
dataFile <- "./data/household_power_consumption.txt"

# read the data from data file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# take data of two days only because loading whole data is expensive
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Take data of Global_active_power only
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Save the output to png file
png("plot1.png", width=480, height=480)

# Generate the plot
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the connection
dev.off()