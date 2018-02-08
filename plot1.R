electricity_data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", 
                               col.names = colnames(read.table("household_power_consumption.txt", sep=";", header = TRUE, nrow =1)),
                               colClasses =  c(rep("character",2), rep("numeric", 7)), skip = 66637, nrows = 2880)
electricity_data[,"TimeStamp"] <- paste(electricity_data[,1], electricity_data[,2], sep = " ")
times <- strptime(electricity_data[,"TimeStamp"], "%d/%m/%Y %H:%M:%S")

png("plot1.png",width = 480, height = 480)

hist(electricity_data[,"Global_active_power"], xlab="Global Active Power (kilowattts)", main ="Global Active Power", col = "red")

dev.off()