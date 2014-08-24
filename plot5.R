NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_baltimore <- subset(NEI, fips == "24510")

motor_list <-  grep("motor", SCC$Short.Name, ignore.case = TRUE)
motor_scc_list <- SCC[coal_list, ]$SCC

motor_nei <- NEI_baltimore[which(NEI_baltimore$SCC %in% motor_scc_list),]

year_emissions <- motor_nei[c("year", "Emissions")]
aggregated_sum_data <- aggregate(year_emissions[c("Emissions")], by=list(year_emissions$year), FUN=sum)

png(filename='plot5.png')
plot(aggregated_sum_data$Group.1, aggregated_sum_data$Emissions, xlab="Year", ylab="Total Emissions Motor Vehicles")
lines(aggregated_sum_data$Group.1, aggregated_sum_data$Emissions, type='l')
dev.off()