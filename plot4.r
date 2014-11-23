NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

library(ggplot2)
ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() + guides(fill=FALSE) +
        labs(x="year", y="Total PM2.5 Emission (10E5 Tons)") +
        labs(title="PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")
print(ggp)

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
