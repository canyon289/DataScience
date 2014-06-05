#Set working directory and load file
setwd("C:/Users/carbon/Dropbox/Github/DataScience/Programming Assignment 3")

rankall = function(outcome, num = "best"){
    #Read Data
    data = read.table("outcome-of-care-measures.csv", sep =",", header = T,na.strings="Not Available")
    
    states = unique(data$State)
    hospital = c()
    
    for(state in states){
        if(num == "best"){
            if(class(names(best(state, outcome))[1]) == "character"){
                hospital = append(hospital, names(best(state, outcome))[1])
             }
        }
             
        if(num == "worst"){
                hospital = append(hospital, tail(names(best(state, outcome)),1))
            }
            
        else 
                hospital = append(hospital, names(best(state, outcome))[num])
            
    }
    
    return(data.frame(hospital, state = states))
}