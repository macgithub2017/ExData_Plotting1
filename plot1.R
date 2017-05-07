df  <- read.table("household_power_consumption.txt", header = T, sep=";")
df2 <- rbind(subset(df, Date == ("1/2/2007")), subset(df, Date == ("2/2/2007")))

hist(as.numeric(as.character(df2$Global_active_power)), col="red", 
	xlab="Global Active Power (kilowatts)",
	main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()

