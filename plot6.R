require("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dt<-SCC[grep("Vehicles",SCC$EI.Sector,ignore.case = TRUE),]
filt <- subset(NEI, fips == "24510" | fips == "06037")
dt<-subset(filt,filt$SCC %in% dt$SCC)
dt<-aggregate(dt$Emissions,list(year=dt$year,city=dt$fips),sum)
dt[dt$city=="06037","city"]<-"Los Angeles"
dt[dt$city=="24510","city"]<-"Baltimore"
png('plot6.png', width=480, height=480)
im<-ggplot(dt,aes(x = year,y=x,color=city))+geom_line()+ylab("Emission")+
    ggtitle("Baltimore & Los Angeles Vehicle Emissions")
print(im)
dev.off()