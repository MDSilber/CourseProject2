NEI <- readRDS("summarySCC_PM25.rds")

baltimoreData <- NEI[NEI$fips == "24510", ]
emissionSums <- sapply(unique(NEI$year), function(x) { sum(baltimoreData[baltimoreData$year == x, ]$Emission) } )
data <- data.frame("Year" = unique(NEI$year), "Emissions" = emissionSums)
png("plot2.png", width = 480, height = 480)
barplot(data$Emissions, names.arg = data$Year, xlab="Year", ylab="Emissions (tons)", ylim=c(0, 3500), main = "PM2.5 Emissions\nBaltimore, MD")
dev.off()