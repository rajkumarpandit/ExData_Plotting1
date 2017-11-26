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

par(mfrow=c(2,2))
# first plot
plot(data$DateTime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# second plot
plot(data$DateTime, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")


# third plot 
plot(data$DateTime, data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)

# fourth plot
plot(data$DateTime, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$DateTime, data$Global_reactive_power)

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()