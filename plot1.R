plot1 <- function()
{
        setwd("G:/Exploratory Data Analysis/Assignment1/exdata_data_household_power_consumption")
        Energy <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, 
                           colClasses="character")
        
        S <- Energy[as.Date(Energy[, "Date"], format = "%d/%m/%Y") == as.Date("2007-02-01") | 
                            as.Date(Energy[, "Date"], format = "%d/%m/%Y") == as.Date("2007-02-02"),]
        
        
        png(filename="plot1.png", width=480, height=480)
        hist(as.numeric(S[S$Global_active_power != "?","Global_active_power"]),
             freq=TRUE, breaks=seq(0,12,0.5), main="Global Active Power", xlim=c(0, 6),
             col = "red", xlab = "Global Active Power (kilowatts)", xaxt="n")
        axis(side=1, at=seq(0,6,2), labels=seq(0,6,2))
        dev.off()
}