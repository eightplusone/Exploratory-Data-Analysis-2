NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal combustion-related data
coal <- SCC[grep('coal', SCC$Short.Name), ]
coalEmissions <- NEI[NEI$SCC %in% coal$SCC, ]
coalEmissionsByYear <- aggregate(Emissions ~ year, coalEmissions, sum)

# Plot
png('plot4.png', height=500, width=500)

library(ggplot2)

pl <- ggplot(coalEmissionsByYear,aes(factor(year),Emissions/1e5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  
  guides(fill=FALSE) +
  labs(x="Year", y="Total PM2.5 Emission (100,000 Tons)") + 
  labs(title="PM2.5 Coal Combustion Source Emissions Across the US from 1999-2008")

print(pl)

dev.off()