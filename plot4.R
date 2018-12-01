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
GRP <- as.numeric(ssdata$Global_reactive_power)
V <- as.numeric(ssdata$Voltage)

#Plotting

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) #create 2x2 subplots

#subplot1
plot(DT, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#subplot2
plot(DT, V, type="l", xlab="datetime", ylab="Voltage")
#subplot3
plot(DT, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(DT, sm2, type="l", col="red")
lines(DT, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), bty="o")
#subplot4
plot(DT, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
