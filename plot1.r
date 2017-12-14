##Creating a data frame of the household power consumption information
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Formatting the date information from the table to Type Date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  
## Extracting a subset of the data from 2007-02-01 to 2007-02-02
hpc <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Create the first plot using the histogram function
  hist(hpc$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Saving the plot as a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()