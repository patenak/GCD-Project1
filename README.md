README.md
=========

by patenak

https://github.com/patenak/GCD-Project1



Getting and cleaning Data

Johns Hopkins Bloomberg School of Health / Cousera

Class getdata-005; July 2014

Project 1

Version 1.0



Data set used for project can be located at UCI's Machine Learning Repository:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Direct link to dataset (zip archive):

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original Source:
-----------------
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy.

activityrecognition '@' smartlab.ws

www.smartlab.ws


Purpose:
--------

The purpose of this project is to demonstrate the students ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

Requirements for submission include:
 
1. a tidy data set
2. a link to a Github repository with a developed script for performing the analysis
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

Files Needed from UCI HAR Dataset archive (UCI HAR Dataset.zip) to perform analysis:
====================================================================================
path: /UCI HAR Dataset/
-----------------------

*README.txt:*		readme file for original experiment

*activity_labels:*	lisitng of numeric codes for each activity type

*features_info:* 	Information on feature selection and variables of the feature vectors

*features.txt:*		listing of variables for which data was collected

path: /UCI HAR Dataset/test/
----------------------------

*X_test.txt:*		test dataset

*subject_test.txt:*	listing of test subject number

*y_test.txt:*		listing of activity code

path: /UCI HAR Dataset/train/
-----------------------------

*X_train.txt:*		train dataset

*subject_train.txt:*	listing of test subject number

*y_train.txt:*		listing of activity code

**NOTE: both test and train folders contain folders for Internal Signals which are not used for analysis since all required data is included in X_test.txt and X_train.txt files.**

Data / Feature Description 
==========================

**from source *README.txt*:**

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."

**from source *features_info.txt*:**


"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."


OTHER FILES:
============

https://github.com/patenak/GCD-Project1

README.md:  this file

run_analysis.R:  R script to produce tidy data set

HARmeantidy.txt:  text file of tidy data set

CodeBook.md:  codebook for tidy dataset


Instructions:
=============

1) Download UCI HAR Dataset archive (UCI HAR Dataset.zip) from following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2) Unzip archive and move the following files to your working directory:

*features.txt, X_test.txt, subject_test.txt, y_test.txt, X_train.txt, subject_train.txt, y_train.txt*

3) Copy run_analysis.R to your working directory

4) Source run_analysis.R to create tidy data set named *HARmeantidy.txt*

**NOTE:  This file can be re-read into R using:** `read.table("HARmeantidy.txt", header = TRUE)`

run_analysis.R  CODING / RATIONALE:
===================================

1) The features.txt file is read into a table (featurestable) and the second column is extracted to build a vector (tableheader) containing the 561 variable names.  These variable names correspond with the values in the X_test.txt and X_train.txt and are used as the column headers.

2) The tableheader vector is scanned for any instance of mean() or std() variables. A vector of integers (meanstdcols) is constructed from this scan and will be used to select relevent columns from data.  

**NOTE: Per features_info.txt, mean() and std() are designated as Mean value and Standard deviation variables.  meanFreq() and any angle() averages were omitted due to language.**

3) Original test data is read into a data frame (Xtest) and column names are assigned by tableheader object. 

**NOTE: test data contains 561 variables, which corresponds with 561 values in features.txt.  Test data also contains 2947 observations (rows).**

4) Xtest data frame is trimmed to the 66 mean() or std() columns designated by meanstdcols object and all 2947 rows are retained.

5) One table is created for each file; *subject_test.txt* and *y_test.txt* (subjecttest and ytest, respectively). The column names are changed to subjectnumber and activity respectively.  

**NOTE: both files contain 1 variable and 2947 observations, corresponding to a new column for the Xtest data frame.**

6) subjecttest and ytest are column binded to the front of the Xtest data frame, to complete the data frame for the test data.  Resultant Xtest data frame with 2947 observations and 68 variables.

7) Original train data is read into a data frame (Xtrain) and column names are assigned by tableheader object. 

**NOTE: train data contains 561 variables, which corresponds with 561 values in features.txt.  Test data also contains 7352 observations (rows).**

8) Xtrain data frame is trimmed to the 66 mean() or std() columns designated by meanstdcols object and all 7352 rows are retained.

9) One table is created for each file; *subject_train.txt* and *y_train.txt* (subjecttrain and ytrain, respectively). The column names as changed to subjectnumber and activity respectively.  

**NOTE: both files contain 1 variable and 7352 observations, corresponding to a new column for the Xtrain data frame.**

10) subjecttrain and ytrain are column binded to the front of the Xtrain data frame, to complete the data frame for the train data.  Resultant Xtrain data frame with 7352 observations and 68 variables.

11) Both data frames, Xtest and Xtrain, are row binded into one master data frame (Xbound).  Resultant data frame contains 10299 observations and 68 variables, which corresponds to a proper row bind (2947 + 7352 = 10299 observations).

12) Clean up environment so only master data frame Xbound exists.  Create vector of non needed objects and remove via rm().  *Not absolutely needed but helps keep things clean.*

13) Use substitution to convert data in activity column from numeric code (1-6) to descriptive activity. Code for activites is detailed in activity_labels.txt

14) Re-order dataframe by subjectnumber and activity columns.

15) Build a vector (detailvars) from Xbound column names and use substitution to make detailvars more descriptive.  Reassgin Xbound column names with new descriptive vector detailvars. 

**NOTE: descriptors were derived from features_info.txt.**

16) Build a tidy data frame (tidymeandata) that calculates mean for each variable by subject and by activity from Xbound data frame using ddply from plyr package.  

**NOTE: Plyr package can be found at:** http://cran.r-project.org/web/packages/plyr/index.html)

**or installed within R:**  `install.packages("plyr")`

17) Write text file named *HARmeantidy.txt* from tidy data frame (tidymeandata).  

**NOTE: data can be re-read into R using:** `read.table("HARmeantidy.txt", header = TRUE)`
