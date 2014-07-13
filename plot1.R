########## Usage ######################################################
#R code for examining how household energy usage varies 
# over a 2-day period in February, 2007

########## Data #######################################################
# This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. 
# In particular, I will use the “Individual household electric power consumption Data Set”.
# 
# Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a 
# period of almost 4 years. Different electrical quantities and some sub-metering values are available.
# 
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#         
#         Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, 
#                               containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, 
#                                                containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and 
#                                               an air-conditioner.

########## OS and R version #############
# R Version : "R version 3.0.2 (2013-09-25)"
# OS Details : OSX Version 10.9.3 
# Processor: 2.66 GHz Intel Core i7
# Memory: 8 GB 1067 MHz DDR3 



# Folder path
setwd('~/Desktop/ExData_Plotting1/')

# Read all the data from the text file
hpc<-read.table('household_power_consumption.txt',na.strings="?", sep=';', header = T)

# Create a subset with the correspoding dates
hpc_Data<-subset(hpc, hpc$Date=='1/2/2007'| hpc$Date=='2/2/2007')

# remove the total raw dateset
remove(hpc)

# Change and update Date, Time and Global_active_power format
hpc_Data$Date_N<-as.Date.character(hpc_Data$Date, format='%d/%m/%Y')
hpc_Data$Global_active_power<-as.numeric(hpc_Data$Global_active_power)
hpc_Data$Timestamp<-paste(hpc_Data$Date,hpc_Data$Time)
hpc_Data$Time_N<-strptime(hpc_Data$Timestamp, "%d/%m/%Y %H:%M:%S")


# Open the export device PNG 
png(file = "~/Desktop/ExData_Plotting1/figure/plot1.png",height=480,width=480, bg = "white")

# Add the histogram
hist(hpc_Data$Global_active_power,breaks=20,col='red',
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)')

# Close the export device
dev.off()
