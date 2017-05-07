library(lubridate)
df  <- read.table("household_power_consumption.txt", header = T, sep=";")
df2 <- rbind(subset(df, Date == ("1/2/2007")), subset(df, Date == ("2/2/2007")))


df2$Date <- as.Date(df2$Date, format="%d/%m/%Y")
df2$DtTime <- ymd_hms(paste(df2$Date, df2$Time, sep = "_"))


plot(df2$DtTime, as.numeric(as.character(df2$Global_active_power)),
	ylab="Global Active Power (kilowatts)", xlab="",
	main="", type="n")
lines(df2$DtTime, as.numeric(as.character(df2$Global_active_power)))

dev.copy(png, file="plot2.png")
dev.off()

