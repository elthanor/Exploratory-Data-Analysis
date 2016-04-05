require("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dt<-SCC[grep("Coal",SCC$EI.Sector,ignore.case = TRUE),]
dt<-subset(NEI,NEI$SCC %in% dt$SCC)
dt<-aggregate(dt$Emissions,list(year=dt$year),sum)
png('plot4.png', width=480, height=480)
im<-ggplot(dt,aes(x = year,y=x))+geom_line()+ylab("Emission")+
    ggtitle("USA Coal Emissions")
print(im)
dev.off()