setwd("C:/Users/canyon/Documents/GitHub/DataScience/Exploratory Data Analysis/Assignment 2")

#Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Part 4
#Subset based on coal and combustion
sSCC = SCC$SCC[grepl("Comb", SCC$SCC.Level.One) & grepl("Coal", SCC$SCC.Level.Three]

sNEI = NEI[NEI$SCC %in% sSCC,]

df = tapply(sNEI$Emissions, sNEI$year, sum)

qplot(as.numeric(row.names(df)), df,
      main = "Emissions from coal",
      xlab = "Year",
      ylab = "Emissions") + stat_smooth(method = "lm", se = F)

#Part 5
#Subset based on coal and combustion
sSCC = SCC$SCC[SCC$Data.Category == "Onroad"]
sNEI = NEI[NEI$SCC %in% sSCC & NEI$fips == "24510",]

#Create Baltimore Plot
BaltimoreMotorEmissions = tapply(sNEI$Emissions, sNEI$year, sum)

qplot(as.numeric(row.names(BaltimoreMotorEmissions)),
      BaltimoreMotorEmissions
      , main = "Emissions in Baltimore"
      , xlab = "Year"
      , ylab = "Pollutants") + stat_smooth(method = "lm", se = F)


#Part 6
#Subset based on coal and combustion
sSCC = SCC$SCC[SCC$Data.Category == "Onroad"]
sNEI = NEI[NEI$SCC %in% sSCC & NEI$fips %in% c("24510","06037"),]
ComparisonMotorEmissions = ddply(sNEI, .(fips,year), summarize, Pollutants = sum(Emissions) )
qplot(year, Pollutants, data = ComparisonMotorEmissions, facets = .~fips
      , xlab = "Year",
      ) + stat_smooth(method = "lm")
