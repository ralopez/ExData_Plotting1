## reads data from the working directory (the txt file should be there)
  datos<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                  stringsAsFactors=FALSE)
  
## subsets data to especified dates
  sub<-datos[datos$Date=="1/2/2007"|datos$Date=="2/2/2007",]
  
## opens png file device
  png(file="plot1.png") 
  
## plots graph with transparent background
  par(bg="transparent")
  hist(sub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  
## closes png file device  
  dev.off()