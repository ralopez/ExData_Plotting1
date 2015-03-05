## sets language to get weekdays in english
  Sys.setlocale("LC_TIME","English") 
  
## reads data
  datos<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                  stringsAsFactors=FALSE)
  
## subsets data to especified dates
  sub<-datos[datos$Date=="1/2/2007"|datos$Date=="2/2/2007",]

## creates a vector s with date and time in appropriate format
  datetime<-paste(sub$Date,sub$Time,sep=" ")
  s<-strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

## opens png file device
  png(file="plot3.png")

## plots sub_metering_1 in color black with transparent background
  par(bg="transparent")
  plot(s,sub[,7], type="l", ylab="Energy sub metering",xlab="")

## adds sub_metering_2 in red color  
  lines(s,sub[,8], col="red")

## adds sub_metering_3 in blue color 
  lines(s,sub[,9], col="blue")

## adds legend to the graph
  legend("topright", legend=colnames(sub)[7:9],col=c("black","red","blue"), lwd=1, cex=0.9)

## closes png file device
  dev.off()