NEI <- readRDS("summarySCC_PM25.rds")
dt<-subset(NEI,fips=="24510")
dt<-aggregate(dt$Emissions,list(year=dt$year),sum)
png('plot2.png', width=480, height=480)
plot(dt$year,dt$x,type = "p",main = "Baltimore City PM2 Emissions",
     xlab = "Year", ylab = "Emissions")
dev.off()