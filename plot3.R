###Plot 3

if (!file.exists("./Exploratory data analysis in R")){
  dir.create("./Exploratory data analysis in R")
}

file<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
down<-download.file(file,destfile = "Exploratory data analysis in R/data.zip")
dataset<-unzip("Exploratory data analysis in R/data.zip")

library(lubridate)
DF<-read.table(dataset,header = TRUE,stringsAsFactors = FALSE,sep = ";")

DF$Date<-as.Date(DF$Date,format ="%d/%m/%Y")
l<-paste(DF$Date,DF$Time)
DF[,"datetime"]<-l

DF$datetime<-as.POSIXct(DF$datetime,format="%Y-%m-%d %H:%M:%S",tz=Sys.timezone())

DFnew<-DF[DF$Date=="2007/02/01" | DF$Date== "2007/02/02",]

DFnew$Global_active_power<-as.numeric(DFnew$Global_active_power)

png(file="plot3.png",height = 450,width = 450)
plot(DFnew$datetime,DFnew$Sub_metering_1,xlab = "",ylab ="Energy sub metering",type="l")
points(DFnew$datetime,DFnew$Sub_metering_2,col="red",type="l")
points(DFnew$datetime,DFnew$Sub_metering_3,col="blue",type="l")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
