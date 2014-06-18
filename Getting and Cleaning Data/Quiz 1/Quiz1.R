#Set working directory
setwd("C:/Users/carbon/Dropbox/Github/DataScience/Getting and Cleaning Data/Quiz 1")

#Question 1
#Download file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "ss06hid.csv")

#Read csv

h = read.table("ss06hid.csv", head = T, sep = ",")

#Find house worth more than a million
sum(h$VAL == 24, na.rm = T)

#Question 3
#Download File
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
              destfile = "NGAS.xlsx")

#Load xlsx package
library(xlsx)

#Read xlsx
dat = read.xlsx("NGAS2.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)

#Question 4
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
              destfile = "rest.xml")

#Load XML
library(XML)

#Assign to object
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
file = "rest.xml"
doc = xmlInternalTreeParse(file)

#Question 5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
              destfile = "Fread.csv")

#Load data.table
library(data.table)

#Read file
DT = fread("Fread.csv")



#Try all functions quiz
system.time(DT[,mean(pwgtp15),by=SEX])
