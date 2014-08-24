NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_baltimore <- subset(NEI, fips == "24510")
year_emissions <- NEI_baltimore[c("year", "Emissions")]

aggregated_sum_data <- aggregate(year_emissions[c("Emissions")], by=list(year_emissions$year), FUN=sum)

png(filename='plot2.png')
plot(aggregated_sum_data$Group.1, aggregated_sum_data$Emissions, xlab="Year", ylab="Total Emissions for Baltimore City")
lines(aggregated_sum_data$Group.1, aggregated_sum_data$Emissions, type='l')
dev.off()