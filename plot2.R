## Load the data file from the working directory
n <- read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings="?")

## subset for the dates we need
y<-subset(n, Date=="1/2/2007"|Date=="2/2/2007")

## combine data and time and create a new POSIXct column to use for the plot
y$FullDate <- as.POSIXct(paste(y$Date,y$Time,sep=" "),"%d/%m/%Y %H:%M:%S",tz="")

## create a line plot of the data
plot(y$FullDate,y$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
## copy to png file 
dev.copy(png,"plot2.png")
## close the device to write the file 
dev.off()