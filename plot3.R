###preparation
data_full <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F) ##read file
#str(data_full) ##structure, debug
data <- data_full ##copy for handling
data$date_and_time <- strptime(paste(data_full$Date, " ",data_full$Time), format = "%d/%m/%Y %H:%M:%S") ##data and time into 1 new column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") ##Date column to real date
data <- data[data$Date>="2007-02-01" & data$Date <= "2007-02-02",] ##select btw dates
###plotting to png
png(filename = "plot3.png", width = 480, height = 480) ##Draw png for writing/plotting
##plot(data$date_and_time, as.numeric(data$Sub_metering_3), type = "n", xlab=" ", ylab = "Energy sub metering") ##empty chart
plot(data$date_and_time, as.numeric(data$Sub_metering_1), type = "l", xlab=" ", ylab = "Energy sub metering", col="Black") ##sub 1 plot, black
points(data$date_and_time, as.numeric(data$Sub_metering_2), type = "l", col="Red") ##sub 2 plot, red ##add sub 2 plot, red
points(data$date_and_time, as.numeric(data$Sub_metering_3), type = "l", col="Blue") ##sub 3 plot, red ##add sub 3 plot, blue
legend("topright", lwd=1, col = c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) ## add legend
dev.off()