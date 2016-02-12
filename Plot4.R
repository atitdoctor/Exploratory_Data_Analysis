p <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
p <- subset(p, Date == "1/2/2007" | Date == "2/2/2007")
dt <- strptime(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")
png(filename="Plot4.png")
par(mfrow = c(2, 2))

plot(x=dt, y=p[,"Global_active_power"], type="l",ylab="Global Active Power", main="", xlab="")     ## Plot 1
plot(x=dt, y=p[,"Voltage"], type="l",ylab="Voltage", main="", xlab="datetime")     ## Plot 2

plot(x=dt, y=p[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")        # Plot 3
lines(x=dt, y=p[,"Sub_metering_2"], col="red")
lines(x=dt, y=p[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(x=dt, y=p[,"Global_reactive_power"], type="l",ylab="Global_reactive_power", main="", xlab="datetime")       # Plot 4
dev.off()
