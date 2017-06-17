# Load data
f <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                na.strings='?')

# Subset data
f <- subset(f, Date == '1/2/2007' | Date == '2/2/2007')

# Create a combined DateTime column
f$DateTime <- paste(f$Date, f$Time, sep=' ')
f$DateTime <- strptime(f$DateTime, format='%d/%m/%Y %H:%M:%S')

# Open PNG graphics devise
png(file='plot1.png', width=480, height=600)

# Draw Plot 1
with(f, hist(Global_active_power, xlab='Global Active Power (kilowatts)',
             col='red', main='Global Activer Power'))

# Close graphics device
dev.off()
