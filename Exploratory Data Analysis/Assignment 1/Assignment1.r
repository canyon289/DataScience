setwd("C:/Users/carbon/Dropbox/Github/DataScience/Exploratory Data Analysis/Assignment 1")

downloadfile = function(file,url){
    if(!file.exists(file)){
        download.file(url = url, destfile=file)
    }
    else{
        print("File exists")
    }
}

#Start lubridate package
library(lubridate)

#Download the file
downloadfile("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
             ,"power.zip")

#Read in the file
file = read.table("household_power_consumption.txt", header = T, sep = ";",
                  na.strings = "?")

#Change Date from string object to date object
file$Date = dmy(file$Date)

#Subset Feb 1 and 2 of 2007
data = file[file$Date >= dmy("1-2-2007") & file$Date <= dmy("2-2-2007"),]

#Change time column to time object
data$Time = hms(data$Time)

#Combine date and time
data$DateTime = data$Date + data$Time

#Delete Date and Time Column
data$Date = NULL
data$Time = NULL

#Create Plot 1
hist(data$Global_active_power, 
     col = "red", #Change color to red
     main = "Global Active Power", #Add title
     xlab = "Global Active Power (kilowatts)", #X label
     ylab =  "Frequency", # Y label
     )

#Save plot as png
dev.copy(png, file = "plot1.png")
dev.off()

#Create Plot 2
plot(data$DateTime, data$Global_active_power,
    type = "n", #Don't plot anything
    ann = FALSE #Turn off labels for specification later
     )

#Specify only title needed
title(ylab = "Global Active Power (kilowatts)")

#Create line chart with the two variables
lines(data$DateTime, data$Global_active_power, 
      type = "l")

dev.copy(png, file = "plot2.png")
dev.off()

#Create plot 3
#Open png plotting device
#dev.copy was cutting off legend title
png(filename = "plot.png")

plot(data$DateTime,data$Sub_metering_1,
     type = "n", #Don't plot anything
     ann = FALSE #Turn off labels for specification later
     )

lines(data$DateTime,data$Sub_metering_1,
      type = "l",
      col = "black"
      )

lines(data$DateTime,data$Sub_metering_2,
      type = "l",
      col = "red")

lines(data$DateTime,data$Sub_metering_3,
      type = "l",
      col = "blue")

title(ylab = "Energy Metering")

legend("topright",
       legend = colnames(data)[5:7],
       lty = c(1,1,1),
       col = c("black","red","blue"))

dev.off()

#Plot 4
png(filename = "plot4.png")
par(mfrow = c(2,2))

with(data, {
    #Plot first plot
    plot(DateTime, Global_active_power, type = "l", ann = F)
    title(ylab = 'Global Active Power')
    
    #Plot 2
    plot(DateTime, Voltage, type="l")
    
    #Plot 3
    plot(data$DateTime,data$Sub_metering_1,
         type = "n", #Don't plot anything
         ann = FALSE #Turn off labels for specification later
    )
    
    lines(data$DateTime,data$Sub_metering_1,
          type = "l",
          col = "black"
    )
    
    lines(data$DateTime,data$Sub_metering_2,
          type = "l",
          col = "red")
    
    lines(data$DateTime,data$Sub_metering_3,
          type = "l",
          col = "blue")
    
    title(ylab = "Energy Metering")
    
    legend("topright",
           legend = colnames(data)[5:7],
           lty = c(1,1,1),
           col = c("black","red","blue"))
    
    #Plot 4
    
    plot(DateTime, Global_reactive_power, type = "l")
})
dev.off()
