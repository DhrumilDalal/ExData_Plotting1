
#############################################################################

#CREATE FOLLOWING FOLDER
#C:\dhrumil\Personal\Learning\CourseEra\Data Science\Course 4 - EDA\Project 1\exdata_data_household_power_consumption
#Place Input File here
#Output is generated here

#############################################################################

library(mlbench)

#load data from the source file
mydata <- read.csv2("C:\\Dhrumil\\Personal\\Learning\\CourseEra\\Data Science\\Course 4 - EDA\\Project 1\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=T,sep=";",fill = TRUE)

#Add date coulmn for filtering
mydata$Date2 <- as.Date( as.character(mydata$Date), "%d/%m/%Y")



#Obtain the subeset of data to report on
DataSetOfInterest <- subset(mydata,mydata$Date2 >= "2007/02/01" & mydata$Date2 <= "2007/02/02" & mydata$Global_active_power != "?")


#Create computed column
DataSetOfInterest$GlobalActivePower <- round(as.numeric(as.character(DataSetOfInterest$Global_active_power)),2)


#Plot2


DataSetOfInterest$DateTime <- format(as.POSIXct(paste(DataSetOfInterest$Date2, DataSetOfInterest$Time, sep = " ")), "%d/%m/%Y %H:%M")


png(file = "C:\\Dhrumil\\Personal\\Learning\\CourseEra\\Data Science\\Course 4 - EDA\\Project 1\\exdata_data_household_power_consumption\\Plot2.png", bg = "white", width = 480, height = 480)
with(DataSetOfInterest,
  {
    plot(DataSetOfInterest$GlobalActivePower~as.POSIXct(DataSetOfInterest$DateTime,format="%d/%m/%Y %H:%M", origin="01/02/2007 00:00"), type="l", xlab = "DateTime",
         xlim=as.POSIXct(c("01/02/2007 00:00:00","02/02/2007 23:59:00"), format="%d/%m/%Y %H:%M:%S")
         ,ylab="Global Active Power", main="Global Active Power Consumption by Minutes (2/1/2007 - 2/2/2007)")
    
    
    
  }
)
dev.off()