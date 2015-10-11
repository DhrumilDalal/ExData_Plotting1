library(mlbench)

#############################################################################

#CREATE FOLLOWING FOLDER
#C:\dhrumil\Personal\Learning\CourseEra\Data Science\Course 4 - EDA\Project 1\exdata_data_household_power_consumption
#Place Input File here
#Output is generated here

#############################################################################



#load data from the source file
mydata <- read.table("C:\\Dhrumil\\Personal\\Learning\\CourseEra\\Data Science\\Course 4 - EDA\\Project 1\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=T,sep=";",fill = TRUE)

#Add date coulmn for filtering
mydata$Date2 <- as.Date( as.character(mydata$Date), "%d/%m/%Y")


#Obtain the subeset of data to report on
DataSetOfInterest <- subset(mydata,mydata$Date2 >= "2007/02/01" & mydata$Date2 <= "2007/02/02" & mydata$Global_active_power != "?")


#Create computed column
DataSetOfInterest$GlobalActivePower <- round(as.numeric(as.character(DataSetOfInterest$Global_active_power)),2)


png(file = "C:\\Dhrumil\\Personal\\Learning\\CourseEra\\Data Science\\Course 4 - EDA\\Project 1\\exdata_data_household_power_consumption\\Plot1.png", bg = "white", width = 480, height = 480)
#Plot the histogram
hist(DataSetOfInterest$GlobalActivePower,col="red", main="GLobal Active Power", xlab="Global Active Power (Kilowatts)")

dev.off()