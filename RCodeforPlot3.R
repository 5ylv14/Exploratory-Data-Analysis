#3 PNG and R Code file
setwd("D:/SCML/To do/Coursera/Data Science/4.ExploratoryDataAnalysis/4.WeekFour/CourseProject2")
getwd()


# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

sub_emissions<- subset(NEI,fips="24510")

g<-ggplot(sub_emissions,aes(year,Emissions,color=type))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions for Baltimore City ",x="Year (1999 - 2008)")


dev.off()