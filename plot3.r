##Creating a data frame of the household power consumption information
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Formatting the date information from the table to Type Date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  
## Extracting a subset of the data from 2007-02-01 to 2007-02-02
hpc <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Combining the Date and Time columns as a character and then naming the vector
dateTime <- paste(hpc$Date, hpc$Time)
dateTime <- setNames(dateTime, "DateTime")
  
## Adding a DateTime column to the data frame and formatting it
hpc <- cbind(dateTime, hpc)
hpc$dateTime <- as.POSIXct(dateTime)

## Creating the third plot
with(hpc, {plot(Sub_metering_1~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~dateTime,col='Red')
lines(Sub_metering_3~dateTime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving the plot as a png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()