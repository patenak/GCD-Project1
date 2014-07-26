CodeBook.md 
===========================================================

by patenak
----------
[link](https://github.com/patenak/GCD-Project1)
-----------------------------------------------




Getting and cleaning Data
-------------------------
Johns Hopkins Bloomberg School of Health / Cousera
--------------------------------------------------
Class getdata-005; July 2014
----------------------------
Project 1
---------
Version 1.0
-----------


Data set used for project can be located at UCI's Machine Learning Repository:
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Direct link to dataset (zip archive):
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Original Source:
-----------------
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 

Files Needed from UCI HAR Dataset archive (UCI HAR Dataset.zip) to perform analysis:
====================================================================================
path: /UCI HAR Dataset/
-----------------------
README.txt:		readme file for original experiment
activity_labels:	lisitng of numeric codes for each activity type
features_info: 		Information on feature selection and variables of the feature vectors
features.txt:		listing of variables for which data was collected

path: /UCI HAR Dataset/test/
----------------------------
X_test.txt:		test dataset
subject_test.txt:	listing of test subject number
y_test.txt:		listing of activity code

path: /UCI HAR Dataset/train/
-----------------------------
X_train.txt:		train dataset
subject_train.txt:	listing of test subject number
y_train.txt:		listing of activity code
**NOTE: both test and train folders contain folders for Internal Signals which are not used for analysis since all required data is included in X_test.txt and X_train.txt files.**

run_analysis.R  CODING / RATIONALE:
===================================

1) The features.txt file is read into a table (featurestable) and the second column is extracted to build a vector (tableheader) containing the 561 variable names.  These variable names correspond with the values in the X_test.txt and X_train.txt and are used as the column headers.

2) The tableheader vector is scanned for any instance of mean() or std() variables. A vector of integers (meanstdcols) is constructed from this scan and will be used to select relevent columns from data.  **NOTE: Per features_info.txt, mean() and std() are designated as Mean value and Standard deviation variables.  meanFreq() and any angle() averages were omitted due to language.**

3) Original test data is read into a data frame (Xtest) and column names are assigned by tableheader object. **NOTE: test data contains 561 variables, which corresponds with 561 values in features.txt.  Test data also contains 2947 observations (rows).**

4) Xtest data frame is trimmed to the 66 mean() or std() columns designated by meanstdcols object and all 2947 rows are retained.

5) One table is created for each file; subject_test.txt and y_test.txt (subjecttest and ytest, respectively). The column names as changed to subjectnumber and activity respectively.  **NOTE: both files contain 1 variable and 2947 observations, corresponding to a new column for the Xtest data frame.**

6) subjecttest and ytest are column binded to the front of the Xtest data frame, to complete the data frame for the test data.  Resultant Xtest data frame with 2947 observations and 68 variables.

7) Original train data is read into a data frame (Xtrain) and column names are assigned by tableheader object. **NOTE: train data contains 561 variables, which corresponds with 561 values in features.txt.  Test data also contains 7352 observations (rows).**

8) Xtrain data frame is trimmed to the 66 mean() or std() columns designated by meanstdcols object and all 7352 rows are retained.

9) One table is created for each file; subject_train.txt and y_train.txt (subjecttrain and ytrain, respectively). The column names as changed to subjectnumber and activity respectively.  NOTE: both files contain 1 variable and 7352 observations, corresponding to a new column for the Xtrain data frame.  

10) subjecttrain and ytrain are column binded to the front of the Xtrain data frame, to complete the data frame for the train data.  Resultant Xtrain data frame with 7352 observations and 68 variables.

11) Both data frames, Xtest and Xtrain, are row binded into one master data frame (Xbound).  Resultant data frame contains 10299 observations and 68 variables, which corresponds to a proper row bind (2947 + 7352 = 10299 observations).

12) Clean up environment so only master data frame Xbound exists.  create vector of non needed objects and remove via rm().  *Not absolutely needed but helps keep things clean.*

13) Use substitution to convert data in activity column from numeric code (1-6) to descriptive activity. Code for activites is detailed in activity_labels.txt

14) Re-order dataframe by subjectnumber and activity columns.

15) Build a vector (detailvars) from Xbound column names and use substitution to make detailvars more descriptive.  Reassgin Xbound column names with new descriptive vector detailvars. **NOTE: descriptors were derived from features_info.txt.**

16) Build a tidy data frame (tidymeandata) that calculates mean for each variable by subject and by activity from Xbound data frame using ddply from plyr package.  

NOTE: Plyr package can be found at:  [link](http://cran.r-project.org/web/packages/plyr/index.html) or installed within R:  install.packages("plyr")

17) Write text file named HARmeantidy from tidy data frame (tidymeandata).  **NOTE: data can be re-read into R using:** read.table("HARmeantidy.txt", header = TRUE)

VARIABLE DICTIONARY:
====================

subjectnumber
	subject ID number
		range: 1 -30

activity 
	activity types:
		Walking
		Walking Upstairs
		Walking Downstairs
		Sitting
		Standing
		Laying

*NOTE: All following reported values are the mean value of the listed variable.*

TimeBodyAccelerometerMeanXaxis 
	Time Domain: Body Accelerometer - Mean for X Axis 

TimeBodyAccelerometerMeanYaxis 
	Time Domain: Body Accelerometer - Mean for Y Axis 

TimeBodyAccelerometerMeanZaxis 
	Time Domain: Body Accelerometer - Mean for Z Axis 

TimeBodyAccelerometerStandardDeviationXaxis 
	Time Domain: Body Accelerometer - Standard Deviation for X Axis 

TimeBodyAccelerometerStandardDeviationYaxis 
	Time Domain: Body Accelerometer - Standard Deviation for Y Axis
 
TimeBodyAccelerometerStandardDeviationZaxis 
	Time Domain: Body Accelerometer - Standard Deviation for Z Axis
 
TimeGravityAccelerometerMeanXaxis 
	Time Domain: Gravity Accelerometer - Mean for X Axis 

TimeGravityAccelerometerMeanYaxis 
	Time Domain: Gravity Accelerometer - Mean for Y Axis 

TimeGravityAccelerometerMeanZaxis 
	Time Domain: Gravity Accelerometer - Mean for Z Axis 

TimeGravityAccelerometerStandardDeviationXaxis 
	Time Domain: Gravity Accelerometer - Standard Deviation for X Axis 

TimeGravityAccelerometerStandardDeviationYaxis 
	Time Domain: Gravity Accelerometer - Standard Deviation for Y Axis 

TimeGravityAccelerometerStandardDeviationZaxis 
	Time Domain: Gravity Accelerometer - Standard Deviation for Z Axis 

TimeBodyAccelerometerJerkMeanXaxis 
	Time Domain: Body Accelerometer Jerk - Mean for X Axis 

TimeBodyAccelerometerJerkMeanYaxis 
	Time Domain: Body Accelerometer Jerk - Mean for Y Axis
 
TimeBodyAccelerometerJerkMeanZaxis 
	Time Domain: Body Accelerometer Jerk - Mean for Z Axis 

TimeBodyAccelerometerJerkStandardDeviationXaxis 
	Time Domain: Body Accelerometer Jerk - Standard Deviation for X Axis
 
TimeBodyAccelerometerJerkStandardDeviationYaxis 
	Time Domain: Body Accelerometer Jerk - Standard Deviation for Y Axis
 
TimeBodyAccelerometerJerkStandardDeviationZaxis 
	Time Domain: Body Accelerometer Jerk - Standard Deviation for Z Axis 

TimeBodyGyroscopeMeanXaxis 
	Time Domain: Body Gyroscope - Mean for X Axis 

TimeBodyGyroscopeMeanYaxis 
	Time Domain: Body Gyroscope - Mean for Y Axis 

TimeBodyGyroscopeMeanZaxis 
	Time Domain: Body Gyroscope - Mean for Z Axis 

TimeBodyGyroscopeStandardDeviationXaxis 
	Time Domain: Body Gyroscope - Standard Deviation for X Axis 

TimeBodyGyroscopeStandardDeviationYaxis 
	Time Domain: Body Gyroscope - Standard Deviation for Y Axis 

TimeBodyGyroscopeStandardDeviationZaxis 
	Time Domain: Body Gyroscope - Standard Deviation for Z Axis 

TimeBodyGyroscopeJerkMeanXaxis 
	Time Domain: Body Gyroscope Jerk - Mean for X Axis 

TimeBodyGyroscopeJerkMeanYaxis 
	Time Domain: Body Gyroscope Jerk - Mean for Y Axis 

TimeBodyGyroscopeJerkMeanZaxis 
	Time Domain: Body Gyroscope Jerk - Mean for Z Axis 

TimeBodyGyroscopeJerkStandardDeviationXaxis 
	Time Domain: Body Gyroscope Jerk - Standard Deviation for X Axis 

TimeBodyGyroscopeJerkStandardDeviationYaxis 
	Time Domain: Body Gyroscope Jerk - Standard Deviation for Y Axis 

TimeBodyGyroscopeJerkStandardDeviationZaxis 
	Time Domain: Body Gyroscope Jerk - Standard Deviation for Z Axis 

TimeBodyAccelerometerMagnitudeMean 
	Time Domain: Body Accelerometer Magnitude - Mean 

TimeBodyAccelerometerMagnitudeStandardDeviation 
	Time Domain: Body Accelerometer Magnitude - Standard Deviation
 
TimeGravityAccelerometerMagnitudeMean 
	Time Domain: Gravity Accelerometer Magnitude - Mean 

TimeGravityAccelerometerMagnitudeStandardDeviation 
	Time Domain: Gravity Accelerometer Magnitude - Standard Deviation 

TimeBodyAccelerometerJerkMagnitudeMean 
	Time Domain: Body Accelerometer Jerk Magnitude - Mean 

TimeBodyAccelerometerJerkMagnitudeStandardDeviation 
	Time Domain: Body Accelerometer Jerk Magnitude - Standard Deviation 

TimeBodyGyroscopeMagnitudeMean 
	Time Domain: Body Gyroscope Magnitude - Mean 

TimeBodyGyroscopeMagnitudeStandardDeviation 
	Time Domain: Body Gyroscope Magnitude - Standard Deviation 

TimeBodyGyroscopeJerkMagnitudeMean 
	Time Domain: Body Gyroscope Jerk Magnitude - Mean 

TimeBodyGyroscopeJerkMagnitudeStandardDeviation 
	Time Domain: Body Gyroscope Jerk Magnitude - Standard Deviation 

FrequencyBodyAccelerometerMeanXaxis 
	Frequency Domain: Body Accelerometer - Mean for X Axis 

FrequencyBodyAccelerometerMeanYaxis 
	Frequency Domain: Body Accelerometer - Mean for Y Axis 

FrequencyBodyAccelerometerMeanZaxis 
	Frequency Domain: Body Accelerometer - Mean for Z Axis 

FrequencyBodyAccelerometerStandardDeviationXaxis 
	Frequency Domain: Body Accelerometer - Standard Deviation for X Axis 

FrequencyBodyAccelerometerStandardDeviationYaxis 
	Frequency Domain: Body Accelerometer - Standard Deviation for Y Axis 

FrequencyBodyAccelerometerStandardDeviationZaxis 
	Frequency Domain: Body Accelerometer - Standard Deviation for Z Axis 

FrequencyBodyAccelerometerJerkMeanXaxis 
	Frequency Domain: Body Accelerometer Jerk - Mean for X Axis 

FrequencyBodyAccelerometerJerkMeanYaxis 
	Frequency Domain: Body Accelerometer Jerk - Mean for Y Axis 

FrequencyBodyAccelerometerJerkMeanZaxis 
	Frequency Domain: Body Accelerometer Jerk - Mean for Z Axis 

FrequencyBodyAccelerometerJerkStandardDeviationXaxis 
	Frequency Domain: Body Accelerometer Jerk - Standard Deviation for X Axis 

FrequencyBodyAccelerometerJerkStandardDeviationYaxis 
	Frequency Domain: Body Accelerometer Jerk - Standard Deviation for Y Axis 

FrequencyBodyAccelerometerJerkStandardDeviationZaxis 
	Frequency Domain: Body Accelerometer Jerk - Standard Deviation for Z Axis 

FrequencyBodyGyroscopeMeanXaxis 
	Frequency Domain: Body Gyroscope - Mean for X Axis 

FrequencyBodyGyroscopeMeanYaxis 
	Frequency Domain: Body Gyroscope - Mean for Y Axis 

FrequencyBodyGyroscopeMeanZaxis 
	Frequency Domain: Body Gyroscope - Mean for Z Axis 

FrequencyBodyGyroscopeStandardDeviationXaxis 
	Frequency Domain: Body Gyroscope - Standard Deviation for X Axis 

FrequencyBodyGyroscopeStandardDeviationYaxis 
	Frequency Domain: Body Gyroscope - Standard Deviation for Y Axis 

FrequencyBodyGyroscopeStandardDeviationZaxis 
	Frequency Domain: Body Gyroscope - Standard Deviation for Z Axis 

FrequencyBodyAccelerometerMagnitudeMean 
	Frequency Domain: Body Accelerometer Magnitude - Mean 

FrequencyBodyAccelerometerMagnitudeStandardDeviation 
	Frequency Domain: Body Accelerometer Magnitude - Standard Deviation 

FrequencyBodyAccelerometerJerkMagnitudeMean 
	Frequency Domain: Body Accelerometer Jerk Magnitude - Mean 

FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation 
	Frequency Domain: Body Accelerometer Jerk Magnitude - Standard Deviation 

FrequencyBodyGyroscopeMagnitudeMean 
	Frequency Domain: Body Gyroscope Magnitude - Mean 

FrequencyBodyGyroscopeMagnitudeStandardDeviation 
	Frequency Domain: Body Gyroscope Magnitude - Standard Deviation 

FrequencyBodyGyroscopeJerkMagnitudeMean 
	Frequency Domain: Body Gyroscope Jerk Magnitude - Mean 

FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation 
	Frequency Domain: Body Gyroscope Jerk Magnitude - Standard Deviation 


