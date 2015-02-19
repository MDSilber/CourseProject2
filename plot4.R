NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalCodes <- as.character(SCC[grepl("[Cc]oal", as.character(SCC$Short.Name)) | grepl("[Cc]omb", as.character(SCC$Short.Name)), ]$SCC)
emissionSubset <- NEI[NEI$SCC %in% coalCodes, ]
emissionSums <- sapply(unique(emissionSubset$year), function(x) { sum(emissionSubset[emissionSubset$year == x, ]$Emission)/1e6 } )
data <- data.frame("Year" = unique(NEI$year), "Emissions" = emissionSums)
png("plot4.png", width = 480, height = 480)
barplot(data$Emissions, names.arg = data$Year, xlab="Year", ylab="Emissions (millions of tons)", ylim=c(0,2), main="Coal-related PM2.5 Emissions\nUSA")
dev.off()