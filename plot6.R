NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_baltimore <- subset(NEI, fips == "24510")
year_emissions <- NEI_baltimore[c("year", "Emissions")]
baltimore_aggregated_sum_data <- aggregate(year_emissions[c("Emissions")], by=list(year_emissions$year), FUN=sum)

NEI_la <- subset(NEI, fips == "06037")
year_emissions <- NEI_la[c("year", "Emissions")]
lac_sum_data <- aggregate(year_emissions[c("Emissions")], by=list(year_emissions$year), FUN=sum)

png(filename='plot6.png')
par (mfrow = c(2,1))

plot(baltimore_aggregated_sum_data$Group.1, baltimore_aggregated_sum_data$Emissions, xlab="Year", ylab="Total Emissions for Baltimore City")
lines(baltimore_aggregated_sum_data$Group.1, baltimore_aggregated_sum_data$Emissions, type='l')

plot(lac_sum_data$Group.1, lac_sum_data$Emissions, xlab="Year", ylab="Total Emissions for LA County")
lines(lac_sum_data$Group.1, lac_sum_data$Emissions, type='l')
dev.off()