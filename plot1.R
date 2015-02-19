NEI <- readRDS("summarySCC_PM25.rds")

emissionSums <- sapply(unique(NEI$year), function(x) { sum(NEI[NEI$year == x, ]$Emission)/1e6 } )
data <- data.frame("Year" = unique(NEI$year), "Emissions" = emissionSums)
png("plot1.png", width = 480, height = 480)
barplot(data$Emissions, names.arg = data$Year, xlab="Year", ylab="Emissions (millions of tons)", ylim=c(0,8), main="PM2.5 Emissions\nUSA")
dev.off()