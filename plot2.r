# Load data
f <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                na.strings='?')

# Subset data
f <- subset(f, Date == '1/2/2007' | Date == '2/2/2007')

# Create a combined DateTime column
f$DateTime <- paste(f$Date, f$Time, sep=' ')
f$DateTime <- strptime(f$DateTime, format='%d/%m/%Y %H:%M:%S')

# Open PNG graphics devise
png(file='plot2.png', width=480, height=600)

# Draw Plot 2
with(f, plot(DateTime, Global_active_power, type='n', xlab='', ylab='Global 
             Active Power (kilowatts)'))
with(f, lines(DateTime, Global_active_power))

# Close graphics device
dev.off()

