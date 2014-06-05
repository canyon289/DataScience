#Quiz 1 
setwd("C:/Users/carbon/Dropbox/Coursera/R Programming/Quiz 1")
D = read.table("hw1_data.csv", header = T, sep=",")

#Question 1
head(D,2)

 #Question 2
tail(D,2)

#Question 3
D[47,]

#Question 16
dim(D[D$Ozone == NA,])

#Question 17
mean(D$Ozone, na.rm = T)

#Question 18
mean(D[(D$Ozone > 31) & (D$Temp > 90),"Solar.R"], na.rm=T)

#Question 19
mean(D[D$Month ==6, "Temp"], na.rm=T)

#Question 20
max(D[D$Month == 5, "Ozone"], na.rm = T)
