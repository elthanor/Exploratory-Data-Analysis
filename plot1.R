NEI <- readRDS("summarySCC_PM25.rds")
dt<-aggregate(NEI[,"Emissions"],list(year=NEI$year),sum)
png('plot1.png', width=480, height=480)
plot(dt$year,dt$x , type = "p", main = "PM2 Emissions",xlab = "Year",
     ylab = "Emissions")
dev.off()