#Week 1 peer graded assignment
#I downloaded the zip file manually and extracted it in my working directory 
getwd()
setwd("C:/ImportantFiles/RK/Education/DataScience/exploratory_Data_Analysis/week1")
getwd()
fileData <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- fileData[(fileData$Date=="1/2/2007" | fileData$Date=="2/2/2007" ), ]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()