require("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
dt<-subset(NEI,fips=="24510")
dt<-aggregate(dt$Emissions,list(type=dt$type,year=dt$year),sum)
png('plot3.png', width=480, height=480)
im<-ggplot(dt,aes(x = year,y=x,color=type))+geom_line()+ylab("Emission")+
    ggtitle("Baltimore Emissions by Type")
dev.off()