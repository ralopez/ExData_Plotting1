## sets language to get weekdays in english
  Sys.setlocale("LC_TIME","English") 
  
## reads data from the working directory (the txt file should be there)
  datos<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                  stringsAsFactors=FALSE)
  
## subsets data to especified dates
  sub<-datos[datos$Date=="1/2/2007"|datos$Date=="2/2/2007",]
  
## creates a vector s with date and time in appropriate format
  datetime<-paste(sub$Date,sub$Time,sep=" ")
  s<-strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
  
## opens png file device
  png(file="plot4.png")
  
## sets the drawing space to host 4 graphs with transparent background 
  par(mfrow=c(2,2), mar=c(4,4,3,1),oma=c(0,0,2,0),bg="transparent")
  
###plots Global active Power
  plot(s,sub[,3], type="l", ylab="Global Active Power",xlab="",cex.lab=1,cex.axis=0.7)
  
###plots Voltage
  plot(s,sub[,5], type="l", ylab="Voltage",xlab="datetime",cex.lab=1,cex.axis=0.7)
  
###plots Sub metering
  plot(s,sub[,7], type="l", ylab="Energy sub metering",xlab="",cex.lab=1,cex.axis=0.7)
  lines(s,sub[,8], col="red")
  lines(s,sub[,9], col="blue")
  legend("topright", bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1, lty=1, cex=1)
  
###plots Global_reactive_power
  plot(s,sub[,4], type="l", ylab="Global_reactive_power",xlab="datetime",cex.lab=1,cex.axis=0.7)
  
## closes png file device
  dev.off()