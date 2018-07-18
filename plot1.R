###preparation
data_full <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F) ##read file
#str(data_full) ##structure, debug
data <- data_full ##copy for handling
data$date_and_time <- strptime(paste(data_full$Date, " ",data_full$Time), format = "%d/%m/%Y %H:%M:%S") ##data and time into 1 new column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") ##Date column to real date
data <- data[data$Date>="2007-02-01" & data$Date <= "2007-02-02",] ##select btw dates
###plotting to png
png(filename = "plot1.png", width = 480, height = 480) ##Draw png for writing/plotting
hist(as.numeric(data$Global_active_power), col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") ##histogram, w/column convert to numeric
dev.off()