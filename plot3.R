library(data.table)
setwd('/Users/sougatabhattacharya/myspaces/course/john-hopkins/assignments/course4/ExData_Plotting1')
#Reads in data from file then subsets data for specified dates

df <- read.table("data/household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filter only Date for given Date
df <-df[df$Date %in% c('1/2/2007',"2/2/2007"),]

subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)

#Data time Conversion
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
