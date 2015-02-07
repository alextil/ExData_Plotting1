## Load the data file from the working directory
n <- read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings="?")
## subset for the dates we need
y<-subset(n, Date=="1/2/2007"|Date=="2/2/2007")
## create a histogram of the data
hist(y$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
## copy to png file 
dev.copy(png,"plot1.png")
## close the device to write the file 
dev.off()

