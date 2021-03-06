p <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
p <- subset(p, Date == "1/2/2007" | Date == "2/2/2007")
dt <- strptime(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")
png(filename="Plot2.png")
plot(x=dt, y=p[,"Global_active_power"], type="l",ylab="Global Active Power (kilowatts)", main="", xlab="")
dev.off()
