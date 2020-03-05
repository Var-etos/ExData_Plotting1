###Plot 1

## Set wd

getwd()
if (!file.exists("./Exploratory data analysis in R")){
  dir.create("./Exploratory data analysis in R")
}

file<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
down<-download.file(file,destfile = "Exploratory data analysis in R/data.zip")
dataset<-unzip("Exploratory data analysis in R/data.zip")

library(lubridate)
DF<-read.table(dataset,header = TRUE,stringsAsFactors = FALSE,sep = ";")


DF$Date<-as.Date(DF$Date,format ="%d/%m/%Y")

DFnew<-DF[DF$Date=="2007/02/01" | DF$Date== "2007/02/02",]

str(DFnew)
DFnew$Global_active_power<-as.numeric(DFnew$Global_active_power)

png(file="plot1.png",height = 450,width = 450)
hist(DFnew$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")
dev.off()