require("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dt<-SCC[grep("Vehicles",SCC$EI.Sector,ignore.case = TRUE),]
baltmr <- subset(NEI, fips == "24510")
dt<-subset(baltmr,baltmr$SCC %in% dt$SCC)
dt<-aggregate(dt$Emissions,list(year=dt$year),sum)
png('plot5.png', width=480, height=480)
im<-ggplot(dt,aes(x = year,y=x))+geom_line()+ylab("Emission")+
    ggtitle("Baltimore Vehicle Emissions")
print(im)
dev.off()