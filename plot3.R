library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_baltimore <- subset(NEI, fips == "24510")

year_emissions <- NEI_baltimore[c("year", "Emissions", "type")]
aggregated_sum_data <- aggregate(year_emissions[c("Emissions")], by=list(year_emissions$year, year_emissions$type), FUN=sum)

png(filename='plot3.png')
ggplot(aggregated_sum_data, aes(Group.1, Emissions)) + geom_point() + facet_grid(. ~ Group.2)
dev.off()