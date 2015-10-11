
#############################################################################

#CREATE FOLLOWING FOLDER
#C:\dhrumil\Personal\Learning\CourseEra\Data Science\Course 4 - EDA\Project 1\exdata_data_household_power_consumption
#Place Input File here
#Output is generated here

#############################################################################

library(mlbench)

#load data from the source file
mydata <- read.table("C:\\Dhrumil\\Personal\\Learning\\CourseEra\\Data Science\\Course 4 - EDA\\Project 1\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=T,sep=";",fill = TRUE)

#Add date coulmn for filtering
mydata$Date2 <- as.Date( as.character(mydata$Date), "%d/%m/%Y")


#Obtain the subeset of data to report on
DataSetOfInterest <- subset(mydata,mydata$Date2 >= "2007/02/01" & mydata$Date2 <= "2007/02/02" & mydata$Global_active_power != "?")


#Create computed column
DataSetOfInterest$SubMetering1 <- round(as.numeric(as.character(DataSetOfInterest$Sub_metering_1)),2)
DataSetOfInterest$SubMetering2 <- round(as.numeric(as.character(DataSetOfInterest$Sub_metering_2)),2)
DataSetOfInterest$SubMetering3 <- round(as.numeric(as.character(DataSetOfInterest$Sub_metering_3)),2)

#Plot3


DataSetOfInterest$DateTime <- format(as.POSIXct(paste(DataSetOfInterest$Date2, DataSetOfInterest$Time, sep = " ")), "%d/%m/%Y %H:%M") 

png(file = "C:\\Dhrumil\\Personal\\Learning\\CourseEra\\Data Science\\Course 4 - EDA\\Project 1\\exdata_data_household_power_consumption\\Plot3.png", bg = "white", width = 480, height = 480)

plot(as.POSIXct(DataSetOfInterest$DateTime,format="%d/%m/%Y %H:%M"), xlab = "DateTime",
     xlim=as.POSIXct(c("01/02/2007 00:00:00","02/02/2007 23:59:00"), format="%d/%m/%Y %H:%M:%S"),
     ylim = range(c( DataSetOfInterest$SubMetering1, DataSetOfInterest$SubMetering2,DataSetOfInterest$SubMetering3)) 
     , frame.plot=TRUE,col="gray",ylab="Submetering Data",yaxt="n")

lines(as.POSIXct(DataSetOfInterest$DateTime,format="%d/%m/%Y %H:%M"),DataSetOfInterest$SubMetering1,col="gray")
lines(as.POSIXct(DataSetOfInterest$DateTime,format="%d/%m/%Y %H:%M"),DataSetOfInterest$SubMetering2,col="red")
lines(as.POSIXct(DataSetOfInterest$DateTime,format="%d/%m/%Y %H:%M"),DataSetOfInterest$SubMetering3,col="blue")



at = c("01/02/2007 00:00","02/02/2007 00:00","03/02/2007 00:00")

DataSetOfInterest$day_1 = at
axis(1,at=1:3,labels=as.Date(at,"%d/%m/%Y %H:%M"))
axis(2)

legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
       col=c("gray", "red", "blue"), lty=1, cex=0.8)
dev.off()
