NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalCodes <- as.character(SCC[grepl("[Cc]oal", as.character(SCC$SCC.Level.Three)), ]$SCC)
emissionSubset <- NEI[NEI$SCC %in% coalCodes, ]
emissionSums <- sapply(unique(emissionSubset$year), function(x) { sum(emissionSubset[emissionSubset$year == x, ]$Emission)/1e3 } )
data <- data.frame("Year" = unique(NEI$year), "Emissions" = emissionSums)
barplot(data$Emissions, names.arg = data$Year, xlab="Year", ylab="Emissions (thousands of tons)", ylim=c(0,600), main="Coal-related PM2.5 Emissions\nin the US")