## Load the data file from the working directory
n <- read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings="?")

## subset for the dates we need
y<-subset(n, Date=="1/2/2007"|Date=="2/2/2007")

## combine data and time and create a new POSIXct column to use for the plot
y$FullDate <- as.POSIXct(paste(y$Date,y$Time,sep=" "),"%d/%m/%Y %H:%M:%S",tz="")

## using dev.copy results in the legend being truncated 
## so this time we will write directly to the  png device 
png(file = "plot3.png", bg = "transparent")

## create a line plot of the data with the first set of sub metering data
plot(y$FullDate,y$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")

## add the second and third sub meter data using red and blue respectively 
points(y$FullDate,y$Sub_metering_2,type="l",col="red")
points(y$FullDate,y$Sub_metering_3,type="l",col="blue")

## now add a legend 
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

## close the png device to write the file 
dev.off()
