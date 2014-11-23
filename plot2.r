NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreNEI <- NEI[NEI$fips=="24510",]

BaltimoreTotals <- aggregate(Emissions ~ year, baltimoreNEI,sum)

barplot(
        BaltimoreTotals$Emissions,
        names.arg=BaltimoreTotals$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions - Baltimore City"
)

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()