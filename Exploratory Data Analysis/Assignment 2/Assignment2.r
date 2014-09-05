setwd("C:/Users/carbon/Dropbox/Github/DataScience/Exploratory Data Analysis/Assignment 2")
setwd("C:/Users/canyon/Documents/GitHub/DataScience/Exploratory Data Analysis/Assignment 2")

#Load packages
library(plyr)

#Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#First plot
NEI$year = as.factor(NEI$year)
z = tapply(NEI$Emissions, NEI$year, sum)

plot(as.numeric(row.names(z)), z, type = "b", pch = 19,
     xlab = "Year", ylab = "Emissions in tons")


#Second Plot
sNEI = NEI[NEI$fips == "24510",]

z = tapply(sNEI$Emissions, sNEI$year, sum)

plot(as.numeric(row.names(z)), z, type = "b", pch = 19,
     xlab = "Year", ylab = "Emissions in tons")

#Third Plot
library(ggplot2)
EmissionsSummary = ddply(sNEI, .(type, year), summarize, Pollutants = sum(Emissions))

qplot(year, Pollutants, data = EmissionsSummary, facets = .~type) + stat_smooth(method = "lm", aes(group =1))

