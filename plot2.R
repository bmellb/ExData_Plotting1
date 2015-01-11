plot2 <- function()
{
        setwd("G:/Exploratory Data Analysis/Assignment1/exdata_data_household_power_consumption")
        Energy <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, 
                           colClasses="character")
        
        S <- Energy[as.Date(Energy[, "Date"], format = "%d/%m/%Y") == as.Date("2007-02-01") | 
                            as.Date(Energy[, "Date"], format = "%d/%m/%Y") == as.Date("2007-02-02"),]
        
        I <- seq(1,2*1440+1,1)
        png(filename="plot2.png", width=480, height=480)
        plot(I, S[I, "Global_active_power"], type="l", ylab="Global Active Power (kilowatts)",
             xlab = "", xaxt="n")
        axis(side=1, at=c(1, 1440+1, 2*1440+1), labels=c("Thu", "Fri", "Sat"))
        dev.off()
}