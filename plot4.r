# Load data
f <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                na.strings='?')

# Subset data
f <- subset(f, Date == '1/2/2007' | Date == '2/2/2007')

# Create a combined DateTime column
f$DateTime <- paste(f$Date, f$Time, sep=' ')
f$DateTime <- strptime(f$DateTime, format='%d/%m/%Y %H:%M:%S')

# Open PNG graphics devise
png(file='plot4.png', width=480, height=600)

# Set global parameter to 2 x 2 graphs
par(mfrow=c(2,2))

# Draw top left graph
with(f, plot(DateTime, Global_active_power, xlab='', 
             ylab='Global Active Power', type='l'))

# Draw top right graph
with(f, plot(DateTime, Voltage, type='l', xlab='datetime', ylab='Voltage'))

# Draw bottom left graph
with(f, plot(DateTime, Sub_metering_1, type='n', xlab='', 
             ylab='Energy sub metering'))
with(f, lines(DateTime, Sub_metering_1))
with(f, lines(DateTime, Sub_metering_2, col='red'))
with(f, lines(DateTime, Sub_metering_3, col='blue'))
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty=c(1,1,1))

# Draw bottom right graph
with(f, plot(DateTime, Global_reactive_power, xlab='datetime', 
             ylab='Global_reactive_power', type='l'))

# Close graphics device
dev.off()

