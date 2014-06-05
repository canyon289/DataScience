#Testing functionality for homework
setwd("C:/Users/carbon/Dropbox/Coursera/R Programming/Assignment 1/specdata")

D = read.table('001.csv', header = T, sep =",")
N = read.table("002.csv", header = T, sep = ",")

n = 1:4
for(i in n){
  print(i)
}

df = data.frame()

c = "Sulfate"