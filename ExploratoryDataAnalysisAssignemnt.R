housedata <- read.table(choose.files(), header = TRUE, sep=";", na.strings = "?")
housedata1 <- rbind(housedata[housedata$Date=="1/2/2007",],
                    housedata[housedata$Date=="2/2/2007",])

#plot one
housedata1$Date <- as.Date(housedata1$Date, format="%d/%m/%Y")
housedata1 <- cbind(housedata1, "DateTime" = as.POSIXct(paste(housedata1$Date, 
                                                             housedata1$Time)))
hist(as.numeric(housedata1$Global_active_power), col="Red", main="Global Active Power", 
     xlab="Global Active power (kilowatts)", ylab="Frequency")
png("plot1.png", width=480, height=480)


#plot two
plot(housedata1$Global_active_power ~ housedata1$DateTime, type="l", xlab= "", 
     ylab="Global Active power (kilowatts)")
png("plot2.png", width=480, height=480)

#plot three
with(housedata1, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", 
                       ylab="Energy Sub Metering")})

lines(housedata1$Sub_metering_2 ~ housedata1$DateTime, col = 'Red')
lines(housedata1$Sub_metering_3 ~ housedata1$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
png("plot3.png", width=480, height=480)

#plot four
par(mfrow=c(2,2))
plot(housedata1$Global_active_power ~ housedata1$DateTime, type="l")
plot(housedata1$Voltage ~ housedata1$DateTime, type="l")

with(housedata1, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(housedata1$Sub_metering_2 ~ housedata1$DateTime, col = 'Red')
lines(housedata1$Sub_metering_3 ~ housedata1$DateTime, col = 'Blue')

plot(housedata1$Global_reactive_power ~ housedata1$DateTime, type="l")
png("plot4.png", width=480, height=480)