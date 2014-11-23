NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

TotalPM <- aggregate(Emissions ~ year,NEI, sum)
barplot(
        (TotalPM$Emissions)/10^6,
        names.arg=TotalPM$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10E6 Tons)",
        main="Total PM2.5 Emissions From All US Sources"
)

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
