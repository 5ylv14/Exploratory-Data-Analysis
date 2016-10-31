#4 PNG and R Code file
setwd("D:/SCML/To do/Coursera/Data Science/4.ExploratoryDataAnalysis/4.WeekFour/CourseProject2")
getwd()


# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

NEI_coal<- NEI[which(NEI$SCC %in% SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]

g<-ggplot(NEI_coal,aes(year,Emissions))

g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from coal combustion-related sources",x="Year (1999 - 2008)")


dev.off()