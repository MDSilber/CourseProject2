NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData <- NEI[NEI$fips == "24510", ]
losAngelesData <- NEI[NEI$fips == "06037", ]
motorCodes <- SCC[grepl("On-Road", SCC$EI.Sector), ]$SCC

processData <- function(data, codes) {
  emissionsSubset <- data[data$SCC %in% motorCodes, ]
  emissionSums <- sapply(unique(emissionsSubset$year), function(x) { sum(emissionsSubset[emissionsSubset$year == x, ]$Emission) } )
  data <- data.frame("Year" = unique(NEI$year), "Emissions" = emissionSums)  
}

baltimoreEmissions <- processData(baltimoreData, motorCodes)
losAngelesEmissions <- processData(losAngelesData, motorCodes)

par(mfrow = c(1,2))
plot(baltimoreEmissions$Year, baltimoreEmissions$Emissions, xlab="Year", ylab="Emissions (tons)", ylim=c(0,350), main="Motor-related PM2.5 Emissions\nBaltimore, MD", pch=19)
abline(lm(baltimoreEmissions$Emissions ~ baltimoreEmissions$Year), col="red")
plot(losAngelesEmissions$Year, losAngelesEmissions$Emissions, xlab="Year", ylab="Emissions (tons)", ylim=c(0,5000), main="Motor-related PM2.5 Emissions\nLos Angeles, CA", pch=19)
abline(lm(losAngelesEmissions$Emissions ~ losAngelesEmissions$Year), col="red")
