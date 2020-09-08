## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregated sum of emissions by year
totalEmissionByYear <- aggregate(Emissions ~ year, NEI, sum)

# Plot
png('plot1.png', width=500, height=500)
barplot(
	height=totalEmissionByYear$Emissions/1e6 + 1, 
	names.arg=totalEmissionByYear$year, 
	xlab='years', 
	ylab='Total PM2.5 emissions (million)', 
	main='Total PM2.5 emissions by year'
	)
dev.off()