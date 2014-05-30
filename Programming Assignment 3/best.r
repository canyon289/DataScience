#Set working directory and load file
setwd("C:/Users/carbon/Dropbox/Github/DataScience/Programming Assignment 3")

#Read table
data = read.table("outcome-of-care-measures.csv", sep =",", header = T,na.strings="Not Available")

#Set State and condition
state = "MD"
condition = ""

#Create Sub Table
sub = droplevels(data[data$State == state,])

z = tapply(sub$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, sub$Hospital.Name, FUN = mean, na.rm=T)
z = sort(z)
z[1]