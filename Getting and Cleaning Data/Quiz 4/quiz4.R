#Quiz 4

setwd("C:/Users/carbon/Dropbox/Github/DataScience/Getting and Cleaning Data/Quiz 4")

downloadfile = function(file,url){
    if(!file.exists(file)){
        download.file(url = url, destfile=file)
    }
    else{
        print("File exists")
    }
}
#Question 1
downloadfile("housing.csv",
             "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

housing = read.csv("housing.csv")
l = strsplit(names(housing),"wgtp")
l[123]

#Question 2
downloadfile("gdp.csv", 
             "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")

gdp = read.csv(file = "gdp.csv", sep = ",", skip = 4, nrows = 190)

colnames(gdp)[1:2] = c("CountryCode", "GDPRank")
colnames(gdp)[5] = "GDP"

gdp$GDP = as.numeric(gsub(",","",gdp$GDP))

#Question 3
grep("^United",gdp$X.3)

#Question 4
downloadfile("FEDStats.csv",
             "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")


fed = read.csv("FEDStats.csv")

#Merge dataframes
mer = merge(fed, gdp, by = "CountryCode")

#Count occurence of this string in Special.Notes
length(grep("Fiscal year end: June", mer$Special.Notes))

#Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

#Count number of samples in 2012
sum(format(sampleTimes, "%Y") == 2012)

sum(format(sampleTimes, "%Y %a") == "2012 Mon")
