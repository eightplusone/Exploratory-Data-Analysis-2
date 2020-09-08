NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Emissions from motor vehicle sources in Baltimore
baltimoreMotorEmissions <- NEI[NEI$type == 'ON-ROAD' & NEI$fips == '24510',]

# Emissions by year
baltimoreMotorEmissionsByYear <- aggregate(Emissions ~ year, baltimoreMotorEmissions, sum)

# Plot
png("plot5.png", width=500, height=500)

library(ggplot2)

pl <- ggplot(baltimoreMotorEmissionsByYear,aes(factor(year),Emissions/1e5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y="Total PM2.5 Emission (10^5 Tons)") + 
  labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")

print(pl)

dev.off()