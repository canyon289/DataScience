#Set working directory and load file
setwd("C:/Users/carbon/Dropbox/Github/DataScience/Programming Assignment 3")

#Set State and condition
rankhospital = function(state, outcome, num = "best"){
    
    z = best(state, outcome)
    
    if(num == "best"){
        return(rownames(z[1]))
    }
    
    else if(num == "worst"){
         return(tail(rownames(z),1))
     }
    
    else
        return(rownames(z)[num])
    
}