# This is a script that  
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


#Set Current Directory
curdir = "C:/Users/carbon/Dropbox/Github/DataScience/Getting and Cleaning Data/Course Project/UCI HAR Dataset"
setwd(curdir)

#Read in feature names
names = read.table("features.txt", sep = " ")

#Convert names into character vector
names = names[["V2"]]
names = as.character(names)

#Read in activities as names
anames = read.table("activity_labels.txt")
anames = as.character(anames$V2)

#Function reads in test and train data
readfiles = function(set){
    setwd(paste(curdir,set, sep="/"))
    
    #Read in subjects
    subjects = paste("subject_", set, ".txt", sep="")
    subjects = read.table(subjects)
    
    #Read in Activity 1-6
    activity = paste("y_", set, ".txt", sep="")
    activity = read.table(activity)
    
    #Read in results
    results = paste("X_", set, ".txt", sep="")
    results = read.table(results)
    
    #Combine dataframes
    df = cbind(subjects,activity,results)
    
    #Assign column names
    colnames(df) = append(c("Subject","Activity"),names)
    
    #Change activity integers to activity names
    df$Activity = factor(df$Activity, labels =anames)
    
    setwd(curdir)
    return(df)
}

#Read in training and testing data
d = readfiles("train")
z = readfiles("test")

#Merge training and testing data
testtrain = rbind(d,z)

#To extract mean columns
meancolindex = grep("mean",colnames(testtrain))

#Extract standard deviation Columns
stdcolindex = grep("std",colnames(testtrain))

#Create tidy dataset of means
library(plyr)
tidyset = ddply(testtrain, .(Subject,Activity), colwise(mean))

#Write csv file
write.csv(tidyset, file = "tidydataset.txt")
write.table(tidyset, file = "tidydataset.txt", sep = "\t")
