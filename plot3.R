electricity_data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", 
                               col.names = colnames(read.table("household_power_consumption.txt", sep=";", header = TRUE, nrow =1)),
                               colClasses =  c(rep("character",2), rep("numeric", 7)), skip = 66637, nrows = 2880)
electricity_data[,"TimeStamp"] <- paste(electricity_data[,1], electricity_data[,2], sep = " ")
times <- strptime(electricity_data[,"TimeStamp"], "%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480, height = 480)

plot(times, electricity_data[,"Sub_metering_1"], type= "n", xlab = "", ylab="Energy sub metering")
lines(times, electricity_data[,"Sub_metering_1"], type="l", col = "black")
lines(times, electricity_data[,"Sub_metering_2"], type="l", col = "red")
lines(times, electricity_data[,"Sub_metering_3"], type="l", col = "blue")
legend("topright",legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=1)

dev.off();