NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Emissions from motor vehicle sources in Baltimore & LA
cityMotorEmissions <- NEI[NEI$fips %in% c('24510', '06037') & NEI$type=='ON-ROAD',]

# Add city names
cityMotorEmissions$city[cityMotorEmissions$fips=="24510"] <- "Baltimore, MD"
cityMotorEmissions$city[cityMotorEmissions$fips=="06037"] <- "Los Angeles, CA"

cityMotorEmissionsByYear <- aggregate(Emissions ~ year + city, cityMotorEmissions, sum)

# Plot
png("plot6.png", width=500, height=500)

library(ggplot2)

ggp <- ggplot(cityMotorEmissionsByYear, aes(x=factor(year), y=Emissions, fill=city)) +
 geom_bar(aes(fill=year),stat="identity") +
 facet_grid(scales="free", space="free", .~city) +
 guides(fill=FALSE) + 
 theme_bw() +
 labs(x="year", y="Total PM Emission") + 
 labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")
 
print(ggp)

dev.off()