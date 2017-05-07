library(lubridate)
df  <- read.table("household_power_consumption.txt", header = T, sep=";")
df2 <- rbind(subset(df, Date == ("1/2/2007")), subset(df, Date == ("2/2/2007")))

df2$Date <- as.Date(df2$Date, format="%d/%m/%Y")
df2$DtTime <- ymd_hms(paste(df2$Date, df2$Time, sep = "_"))


plot(df2$DtTime, as.numeric(as.character(df2$Sub_metering_1)),
	ylab="Energy sub metering", xlab="",
	main="", type="n")
lines(df2$DtTime, as.numeric(as.character(df2$Sub_metering_1 )))
lines(df2$DtTime, as.numeric(as.character(df2$Sub_metering_2 )), col="red")
lines(df2$DtTime, as.numeric(as.character(df2$Sub_metering_3 )), col="blue")

legend("topright", col=c("black", "blue", "red"),lwd=2.5, lty=1,
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()
