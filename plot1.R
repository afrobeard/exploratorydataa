NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

year_emissions <- NEI[c("year", "Emissions")]

aggregated_sum_data <- aggregate(year_emissions[c("Emissions")], by=list(year_emissions$year), FUN=sum)

png(filename='plot1.png')
plot(aggregated_sum_data$Group.1, aggregated_sum_data$Emissions, xlab="Year", ylab="Total Emissions")
lines(aggregated_sum_data$Group.1, aggregated_sum_data$Emissions, type='l')
dev.off()