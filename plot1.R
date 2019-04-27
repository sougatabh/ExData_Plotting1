library(data.table)
setwd('/Users/sougatabhattacharya/myspaces/course/john-hopkins/assignments/course4/ExData_Plotting1')
#Reads in data from file then subsets data for specified dates

df <- read.table("data/household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#summary(df)

#Filter only Data for given Date
df <-df[df$Date %in% c('1/2/2007',"2/2/2007"),]

globalActivePower <- as.numeric(df$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()