plot4 <- function()
{
        setwd("G:/Exploratory Data Analysis/Assignment1/exdata_data_household_power_consumption")
        Energy <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, 
                           colClasses="character")
        
        S <- Energy[as.Date(Energy[, "Date"], format = "%d/%m/%Y") == as.Date("2007-02-01") | 
                            as.Date(Energy[, "Date"], format = "%d/%m/%Y") == as.Date("2007-02-02"),]
        
        
        I <- seq(1,2*1440+1,1)
        png(filename="plot4.png", width=480, height=480)
        par(mfrow=c(2,2))
        plot(I, S[I, "Global_active_power"], type="l", ylab="Global Active Power",
             xlab = "", xaxt="n")
        axis(side=1, at=c(1, 1440+1, 2*1440+1), labels=c("Thu", "Fri", "Sat"))
        
        plot(I, S[I, "Voltage"], type="l", ylab="Voltage",  xlab = "datetime", xaxt="n")
        axis(side=1, at=c(1, 1440+1, 2*1440+1), labels=c("Thu", "Fri", "Sat"))
        
        plot(I, S[I, "Sub_metering_1"], type="l", ylab="Energy sub metering",
             xlab = "", xaxt="n")
        lines(I, S[I, "Sub_metering_2"], type="l", col="red")
        lines(I, S[I, "Sub_metering_3"], type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col=c("black", "red", "blue"), lty=1)
        axis(side=1, at=c(1, 1440+1, 2*1440+1), labels=c("Thu", "Fri", "Sat"))
        
        plot(I, S[I, "Global_reactive_power"], type="l", ylab="Global_reactive_power",  xlab = "datetime", xaxt="n")
        axis(side=1, at=c(1, 1440+1, 2*1440+1), labels=c("Thu", "Fri", "Sat"))
        dev.off()
}