NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreNEI <- NEI[NEI$fips=="24510",]

library(ggplot2)
ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") +
        labs(x="year", y="Total PM2.5 Emission (Tons)") +
        labs(title="PM2.5 Emissions, Baltimore City 1999-2008 by Source Type")
print(ggp)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()