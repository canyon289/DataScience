setwd("C:/Users/canyon/Documents/GitHub/DataScience/Exploratory Data Analysis/Assignment 2")

#Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Part 3"
#Subset based on coal and combustion
sSCC = SCC$SCC[grepl("Comb", SCC$SCC.Level.One) & grepl("Coal", SCC$SCC.Level.Three]

sNEI = NEI[NEI$SCC %in% sSCC,]

df = tapply(sNEI$Emissions, sNEI$year, mean)

qplot(as.numeric(row.names(df)), df, ) + stat_smooth(method = "lm", se = F)
