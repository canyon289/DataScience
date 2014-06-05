# Function that will calculate mean and pollutant data across ID

pollutantmean = function(directory, pollutant, id) {
    #Set working directory to files directory
    setwd(paste(getwd(),directory, sep="/" ))
    f = list.files()
    
    d = data.frame()
    #Add files to dataframe
    #Ask why merge doesn't work on empty data frame
    for(i in id){
      
      temp = read.table(f[[i]],header=T,sep=",")
      d = rbind(d,temp)
      
    }
    setwd("..")
    return(mean(d[[pollutant]], na.rm=T))
}