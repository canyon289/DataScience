#RScript which computes correlation based on complete cases

corr = function(directory, threshold = 0){
    setwd(paste(getwd(),directory, sep ="/"))
    #setwd("C:/Users/carbon/Dropbox/Coursera/R Programming/Assignment 1/specdata")
    f = list.files()
    
    c = numeric()
    for(i in f){
        d = read.table(i, header = T, sep = ",")
        if(sum(complete.cases(d)) >= threshold)
            c = append(c,cor(d$sulfate,d$nitrate, use = "pairwise.complete.obs"))
    }
    setwd("..")
    c
}