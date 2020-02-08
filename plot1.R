# Specify the source file path
filePath <- "./data/household_power_consumption.txt"

# Read the input file, while mentioning the separator and converting the missing values to NA
powerData <- read.delim(file = filePath, header = TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = c("?"))

# Extract the data for 1st and 2nd Feb 2007
powerDataExtract <- subset(powerData, Date == "1/2/2007" | Date == "2/2/2007")

# Specify the device to be plotted to along with the height and width
png(file = "plot1.png", width = 480, height = 480, units = "px")
# Populate the histogram
hist(powerDataExtract$Global_active_power,xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power", col = "red")
dev.off()