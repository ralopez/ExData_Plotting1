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
  png(file="plot2.png") 

## plots graph with transparent background
  par(bg="transparent")
  plot(s,sub[,3], type="l", ylab="Global Active Power (kilowatts)",xlab="",cex.lab=0.9)

## closes png file device  
  dev.off()