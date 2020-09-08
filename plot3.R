## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregated sum of emissions in Baltimore by year
baltimoreNEI <- NEI[NEI$fips=="24510",]
baltimoreTotalByYear <- aggregate(Emissions ~ year, baltimoreNEI, sum)

# Plot
png('plot3.png', height=500, width=500)

library(ggplot2)

pl <- ggplot(baltimoreNEI, aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + 
  guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Source Type", y="Total PM2.5 Emission (Tons)") + 
  labs(title="PM2.5 Emissions in Baltimore City")

print(pl)

dev.off()