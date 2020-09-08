## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregated sum of emissions in Baltimore by year
baltimoreNEI <- NEI[NEI$fips=="24510",]
baltimoreTotalByYear <- aggregate(Emissions ~ year, baltimoreNEI, sum)

# Plot
png('plot2.png', height=500, width=500)
barplot(
	baltimoreTotalByYear$Emissions,
	names.arg=baltimoreTotalByYear$year,
	xlab="Year",
	ylab="PM2.5 Emissions",
	main="Total PM2.5 Emissions in Baltimore city"
	)
dev.off()