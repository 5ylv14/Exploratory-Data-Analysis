#6 PNG and R Code file
setwd("D:/SCML/To do/Coursera/Data Science/4.ExploratoryDataAnalysis/4.WeekFour/CourseProject2")
getwd()


# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

NEI_motorvehicle<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"]),]

tco <- c("24510","06037")

NEI_motorvehicle_both<-subset(NEI_motorvehicle,fips %in% tco)

g<-ggplot(NEI_motorvehicle_both,aes(year,Emissions,color=fips))

g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from motor vehicle for Los Angeles and Baltimore City",x="Year (1999 - 2008)")+scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))

dev.off()