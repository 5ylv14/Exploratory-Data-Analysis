#5 PNG and R Code file
setwd("D:/SCML/To do/Coursera/Data Science/4.ExploratoryDataAnalysis/4.WeekFour/CourseProject2")
getwd()


# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

##after exam the SCC dataframe, 2 variables SCC.Level.Three and Short.Name can be used to subset the motor vehicle source from the SCC dataset. 
NEI_motorvehicle<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"] & NEI$fips=="24510"),]

## use "motor vehicle" get 2 rows of data, use "vehicle" get 667 rows of data, use "motor" get 88 rows of data. after exam subseted datas, I decided to use the motor as the paramter.
g<-ggplot(NEI_motorvehicle,aes(year,Emissions))

g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from motor vehicle for Baltimore City",x="Year (1999 - 2008)")

dev.off()