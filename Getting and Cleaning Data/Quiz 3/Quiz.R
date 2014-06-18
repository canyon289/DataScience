setwd("C:/Users/carbon/Dropbox/Github/DataScience/Getting and Cleaning Data/Quiz 3")


#Question 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "Fss06hid.csv")


q1 = read.table(file = "Fss06hid.csv", header = TRUE, sep = ",")

#use which to figure out which houses with more than 10 acres sold over 10million
#worth of stuff


#ACR = 3 for Acres
#AGS = 6 for $10,000 dollars or more

head(rownames(q1[(q1$ACR == 3 & q1$AGS == 6),]))

z = (q1$ACR == 3 & q1$AGS == 6)
head(which(z))

#Question 2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile="data.jpg", mode = 'wb')
library(jpeg)
j = readJPEG("data.jpg", native = TRUE)
quantile(j, c(.3,.8))

#Question 3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              destfile = "Country.csv")

#Read in GDP
#X
gdp = read.csv("getdata-data-GDP.csv", sep=",", nrows= 190, skip = 4)

#Read in Country
#CountryCode
country = read.csv("getdata-data-EDSTATS_Country.csv", header = TRUE)

f = match(gdp$X, country$Country.Code)

country =country[order(CountryCode),]
gdp = gdp[order(gdp$CountryCode)]

#Number of matches
length(intersect(gdp$X,country$CountryCode))

#Rename Column in GDP
colnames(gdp)[1:2] = c("CountryCode","GDPRank")

#Merge data
m = merge(gdp,country, by = "CountryCode")

#Order DataFrame
m = m[order(m$GDPRank, decreasing = TRUE),]

#Question 4
tapply(m$GDPRank,m$Income.Group,mean)


#Question 5
s = tail(m, n =38)

#Count Occurences
length(which(s$Income.Group == "Lower middle income"))


#Doing it again but using a table
library(Hmisc)
m$GDPGroups = cut(m$GDPRank, breaks = seq(1,190, by=38))
m$GDPGroups = cut2(m$GDPRank, g=5)
