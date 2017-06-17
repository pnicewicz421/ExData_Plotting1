# Load data
f <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                na.strings='?')

# Subset data
f <- subset(f, Date == '1/2/2007' | Date == '2/2/2007')

# Create a combined DateTime column
f$DateTime <- paste(f$Date, f$Time, sep=' ')
f$DateTime <- strptime(f$DateTime, format='%d/%m/%Y %H:%M:%S')

# Open PNG graphics devise
png(file='plot3.png', width=480, height=600)

# Draw Plot 3
with(f, plot(DateTime, Sub_metering_1, type='n', xlab='', 
             ylab='Energy sub metering'))
with(f, lines(DateTime, Sub_metering_1))
with(f, lines(DateTime, Sub_metering_2, col='red'))
with(f, lines(DateTime, Sub_metering_3, col='blue'))

# Add Legend
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty=c(1,1,1))

# Close graphics device
dev.off()

