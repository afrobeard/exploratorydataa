NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_list <-  grep("coal", SCC$Short.Name, ignore.case = TRUE)
coal_scc_list <- SCC[coal_list, ]$SCC
coal_nei <- NEI[which(NEI$SCC %in% coal_scc_list),]

year_emissions <- coal_nei[c("year", "Emissions")]
aggregated_sum_data <- aggregate(year_emissions[c("Emissions")], by=list(year_emissions$year), FUN=sum)

png(filename='plot4.png')
plot(aggregated_sum_data$Group.1, aggregated_sum_data$Emissions, xlab="Year", ylab="Total Emissions for Coal")
lines(aggregated_sum_data$Group.1, aggregated_sum_data$Emissions, type='l')
dev.off()