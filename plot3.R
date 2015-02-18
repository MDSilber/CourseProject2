library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

baltimoreData <- NEI[NEI$fips == "24510", ]
baltimoreData$type <- as.factor(baltimoreData$type)
colnames(baltimoreData)[[5]] <- "Type" # So the name of the legend is capitalized

aggregatedData <- aggregate(Emissions ~ year + Type, baltimoreData, sum)
plot <- ggplot(aggregatedData, aes(year, Emissions, color=Type))
plot <- plot + geom_line() + xlab("Year") + ylab("Emissions (tons)") + ggtitle("PM2.5 Emissions\nBaltimore, MD")
print(plot)