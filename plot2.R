setwd(dir = "~/Data Science/4. Exploratoy Data Analysis/week1/")
fname <- "./household_power_consumption.txt"
powerdata <- read.table(fname, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ssdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
DT <- strptime(paste(ssdata$Date, ssdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(ssdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(DT, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
