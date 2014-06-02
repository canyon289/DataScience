#Set working directory and load file
setwd("C:/Users/carbon/Dropbox/Github/DataScience/Programming Assignment 3")

#Set State and condition
best = function(state, outcome){
    #Read Data
    data = read.table("outcome-of-care-measures.csv", sep =",", header = T,na.strings="Not Available")
    
    if(!(state %in% data$State)){
        stop("invalid state")
    }
    conditions = c("heart attack", "heart failure", "pneumonia")
    if(!(outcome %in% conditions)){
        return("invalid outcome")
    }
    else{
    #Make dictionary of values
    l = list("heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
             "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
             "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    
    
    #Create Sub Table
    sub = droplevels(data[data$State == state,])
    
    z = tapply(sub[[l[[outcome]]]], sub[["Hospital.Name"]], FUN = mean, na.rm=T)
    z = sort(z)
    #rownames(z)[1]
    }
}