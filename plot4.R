# Specify the source file path
filePath <- "./data/household_power_consumption.txt"

# Read the input file, while mentioning the separator and converting the missing values to NA
powerData <- read.delim(file = filePath, header = TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = c("?"))

# Load the library
library(lubridate)

# Extract the data for 1st and 2nd Feb 2007
powerDataExtract <- subset(powerData, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new variable to combine date and time 
powerDataExtract$DateTime <- strptime(paste(powerDataExtract$Date, " ", powerDataExtract$Time), "%d/%m/%Y %H:%M:%S")


# Specify the device to be plotted to along with the height and width
png(file = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2), mar= c(4,4,4,4))
with(powerDataExtract , {
    plot(x = powerDataExtract$DateTime, 
        y= powerDataExtract$Global_active_power,  
        type = "l", 
        xlab = "",
        ylab = "Global Active Power")
    plot(x = powerDataExtract$DateTime, 
        y= powerDataExtract$Voltage,  
        type = "l", 
        xlab = "datetime",
        ylab = "Voltage")
    plot(x = powerDataExtract$DateTime, 
         y= powerDataExtract$Sub_metering_1,  
         type = "l", 
         xlab = "",
         ylab = "Energy sub metering",
    )
    points(x = powerDataExtract$DateTime, 
           y= powerDataExtract$Sub_metering_2,  
           type = "l",
           col = "red")
    points(x = powerDataExtract$DateTime, 
           y= powerDataExtract$Sub_metering_3,  
           type = "l",
           col = "blue")
    plot(x = powerDataExtract$DateTime, 
         y= powerDataExtract$Global_reactive_power,  
         type = "l", 
         xlab = "datetime",
         ylab = "Global_reactive_power")

}
)

dev.off()

