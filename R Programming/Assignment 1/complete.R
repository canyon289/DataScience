#RScript which returns data frame of complete cases

complete = function(directory, id = 1:332){
    #Set working to directory to one with the csvs
    setwd(paste(getwd(), directory ,sep="/"))
    
    #Create vector of file list
    f=list.files()
    
    nobs = integer()
    for(i in id){
        temp = read.table(f[i],header=T,sep=",")
        c = sum(complete.cases(temp))
        nobs = append(nobs,c)
    }
    setwd("..")
    data.frame(id,nobs)
}