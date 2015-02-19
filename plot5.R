NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData <- NEI[NEI$fips == "24510", ]
motorCodes <- SCC[grepl("On-Road", SCC$EI.Sector), ]$SCC
emissionSubset <- baltimoreData[baltimoreData$SCC %in% motorCodes, ]
emissionSums <- sapply(unique(emissionSubset$year), function(x) { sum(emissionSubset[emissionSubset$year == x, ]$Emission) } )
data <- data.frame("Year" = unique(NEI$year), "Emissions" = emissionSums)
png("plot5.png", width = 480, height = 480)
barplot(data$Emissions, names.arg = data$Year, xlab="Year", ylab="Emissions (tons)", ylim=c(0,350), main="Motor-related PM2.5 Emissions\nBaltimore, MD")
dev.off()