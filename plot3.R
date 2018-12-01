#Reading the data

setwd(dir = "~/Data Science/4. Exploratoy Data Analysis/week1/")
fname <- "./household_power_consumption.txt"
powerdata <- read.table(fname, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ssdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
DT <- strptime(paste(ssdata$Date, ssdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(ssdata$Global_active_power)
sm1 <- as.numeric(ssdata$Sub_metering_1)
sm2 <- as.numeric(ssdata$Sub_metering_2)
sm3 <- as.numeric(ssdata$Sub_metering_3)

#Plotting

png("plot3.png", width=480, height=480)
plot(DT, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(DT, sm2, type="l", col="red")
lines(DT, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()
