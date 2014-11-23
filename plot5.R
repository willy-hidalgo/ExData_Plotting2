NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]

library(ggplot2)
ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() + guides(fill=FALSE) +
        labs(x="year", y="Total PM2.5 Emission (10^5 Tons)") +
        labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")
print(ggp)

dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()
