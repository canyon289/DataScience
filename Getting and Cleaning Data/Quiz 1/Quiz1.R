#Set working directory
setwd("C:/Users/carbon/Dropbox/Coursera/Getting and Cleaning Data/Quiz 1")

#Question 1
#Download file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "ss06hid.csv")
