NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissionSums <- sapply(unique(NEI$year), function(x) { sum(NEI[NEI$year == x, ]$Emission)/1e6 } )
data <- data.frame("Year" = unique(NEI$year), "Emissions" = emissionSums)
<<<<<<< HEAD
barplot(data$Emissions, names.arg = data$Year, xlab="Year", ylab="Emissions (millions of tons)", ylim=c(0,8), main="PM2.5 Emissions in the US")
=======
barplot(data$Emissions, names.arg = data$Year, xlab="Year", ylab="Emissions (millions of tons)", ylim=c(0,8))
>>>>>>> c2fba28cfe5f476117579665dd7c99ebb4a4448d
