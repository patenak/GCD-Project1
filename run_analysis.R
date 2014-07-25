##########################################################################
#Getting and Cleaning Data, Project1
#Johns Hopkins Bloomberg SChool of Public Health / Coursera
#Class getdata-005; July 2014
##########################################################################


#(1)Build vector of table headers from features.txt:
featurestable <- read.table("features.txt", stringsAsFactors = FALSE)
tableheader <- featurestable[,2]

#(2)Identify columns for mean() and std() variables
meanstdcols <- grep("mean\\()|std\\()", tableheader)

#(3)Read original test data table and label columns:
Xtest <- read.table("X_test.txt", col.names = tableheader)

#(4)Update test data table to include only mean() and std() variables
Xtest <- Xtest[, meanstdcols]

#(5) Create tables from subject_test.txt and ytest.txt and name appropriately 
subjecttest <- read.table("subject_test.txt", col.names = "subjectnumber")
ytest <- read.table("y_test.txt", col.names = "activity")

#(6)Column bind subjectnumber and activity columns to test data table
Xtest <- cbind(ytest, Xtest)
Xtest <- cbind(subjecttest, Xtest)

#(7)Read original train data table and label columns:
Xtrain <- read.table("X_train.txt", col.names = tableheader)

#(8)Update train data table to include only mean() and std() variables
Xtrain <- Xtrain[, meanstdcols]

#(9)create tables from subject_test.txt and ytest.txt and name appropriately 
subjecttrain <- read.table("subject_train.txt", col.names = "subjectnumber")
ytrain <- read.table("y_train.txt", col.names = "activity")

#(10) Column bind subjectnumber and activity columns to train data table
Xtrain <- cbind(ytrain, Xtrain)
Xtrain <- cbind(subjecttrain, Xtrain)

#(11) Row bind test/train tables into 1 dataframe:
Xbound <- rbind(Xtest, Xtrain)

#(12) Cleanup Environment so only main data frame exists:
rmlist <- c("Xtest","Xtrain","featurestable","subjecttest","subjecttrain", "ytest","ytrain","meanstdcols","rmlist","tableheader")
rm(list = rmlist)

#(13) Activity Code to Descriptive Activity Substitution:
Xbound$activity <- sub("1","walking",Xbound$activity)
Xbound$activity <- sub("2","walkingupstairs",Xbound$activity)
Xbound$activity <- sub("3","walkingdownstairs",Xbound$activity)
Xbound$activity <- sub("4","sitting",Xbound$activity)
Xbound$activity <- sub("5","standing",Xbound$activity)
Xbound$activity <- sub("6","laying",Xbound$activity)

#(14) Ordering by Subject, Activity:
Xbound <- Xbound[order(Xbound$subjectnumber, Xbound$activity), ]

#(15) Rename existing colnames to more be descriptive:
detailvars <- colnames(Xbound)
detailvars <- sub("\\.mean","Mean", detailvars)
detailvars <- sub("\\.std","StandardDeviation", detailvars)
detailvars <- sub("...X","Xaxis", detailvars)
detailvars <- sub("...Y","Yaxis", detailvars)
detailvars <- sub("...Z","Zaxis", detailvars)
detailvars <- sub("\\..","", detailvars)
detailvars <- sub("^t","Time", detailvars)
detailvars <- sub("^f","Frequency", detailvars)
detailvars <- sub("Acc","Accelerometer", detailvars)
detailvars <- sub("Gyro","Gyroscope", detailvars)
detailvars <- sub("Mag","Magnitude", detailvars)
detailvars <- sub("BodyBody","Body", detailvars)
colnames(Xbound) <- detailvars

#(16) Build tidy data sheet for means of each variable
#     By subject and by activity using ddply from plyr package:
library(plyr)
tidymeandata <- ddply(Xbound, .(subjectnumber, activity), numcolwise(mean))

#(17) Output tidy data sheet to text file (HARmeantidy.txt)
write.table(tidymeandata, file = "HARmeantidy.txt", col.names = TRUE)


