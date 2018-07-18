###preparation
data_full <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F) ##read file
#str(data_full) ##structure, debug
data <- data_full ##copy for handling
data$date_and_time <- strptime(paste(data_full$Date, " ",data_full$Time), format = "%d/%m/%Y %H:%M:%S") ##data and time into 1 new column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") ##Date column to real date
data <- data[data$Date>="2007-02-01" & data$Date <= "2007-02-02",] ##select btw dates
###plotting to png
png(filename = "plot2.png", width = 480, height = 480) ##Draw png for writing/plotting
plot(data$date_and_time, as.numeric(data$Global_active_power), type = "l", xlab=" ", ylab = "Global Active Power (kilowatts)") ##plot of GAP per time, line
dev.off()