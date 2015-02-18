NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData <- NEI[NEI$fips == "24510", ]
emissionSums <- sapply(unique(NEI$year), function(x) { sum(baltimoreData[baltimoreData$year == x, ]$Emission) } )
data <- data.frame("Year" = unique(NEI$year), "Emissions" = emissionSums)
barplot(data$Emissions, names.arg = data$Year, xlab="Year", ylab="Emissions (tons)", ylim=c(0, 3500), main = "PM2.5 Emissions - Baltimore, MD")