#Project1
#
#Build table headers:
featurestable <- read.table("features.txt", stringsAsFactors = FALSE)
tableheader <- featurestable[,2]
meanstdcols <- grep("mean\\(|std", tableheader)


#Assemble test data table:
Xtest <- read.table("X_test.txt", col.names = tableheader)
Xtest <- Xtest[, meanstdcols]
subjecttest <- read.table("subject_test.txt", col.names = "subjectnumber")
ytest <- read.table("y_test.txt", col.names = "activity")
Xtest <- cbind(ytest, Xtest)
Xtest <- cbind(subjecttest, Xtest)

#Assemble train data table:
Xtrain <- read.table("X_train.txt", col.names = tableheader)
Xtrain <- Xtrain[, meanstdcols]
subjecttrain <- read.table("subject_train.txt", col.names = "subjectnumber")
ytrain <- read.table("y_train.txt", col.names = "activity")
Xtrain <- cbind(ytrain, Xtrain)
Xtrain <- cbind(subjecttrain, Xtrain)

#Rbind test/train tables into 1 dataframe:
Xbound <- rbind(Xtest, Xtrain)

#Cleanup:
rmlist <- c("Xtest","Xtrain","featurestable","subjecttest","subjecttrain","ytest","ytrain","meanstdcols","rmlist")
rm(list = rmlist)

#Activity Substitution:
Xbound$activity <- sub("1","walking",Xbound$activity)
Xbound$activity <- sub("2","walkingupstairs",Xbound$activity)
Xbound$activity <- sub("3","walkingdownstairs",Xbound$activity)
Xbound$activity <- sub("4","sitting",Xbound$activity)
Xbound$activity <- sub("5","standing",Xbound$activity)
Xbound$activity <- sub("6","laying",Xbound$activity)

#Ordering by Subject, Activity:
Xbound <- Xbound[order(Xbound$subjectnumber, Xbound$activity), ]

#Rename existing colnames to more be descriptive:
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

#Build tidy sheet for means of each variable, by subject and by activity:
library(plyr)
tidymeandata <- ddply(Xbound, .(subjectnumber, activity), numcolwise(mean))

