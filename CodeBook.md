CodeBook.md (for *HARmeantidy.txt*)
===========================================================

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




VARIABLE DICTIONARY:
====================

|Variable | Description|
|---------|-------------|
|subjectnumber | subject ID number (range: 1 -30)|
|activity | activity types (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) |

**NOTE: All reported values for following variables are the mean value of the listed variable. Also, values have been normalized in original data source, so they have a range of [-1,1] and are unitless.**
----------------------------------------------------------------------------------

Variable | Description
---------|-------------
TimeBodyAccelerometerMeanXaxis | Time Domain: Body Accelerometer - Mean for X Axis
TimeBodyAccelerometerMeanYaxis | Time Domain: Body Accelerometer - Mean for Y Axis
TimeBodyAccelerometerMeanZaxis | Time Domain: Body Accelerometer - Mean for Z Axis
TimeBodyAccelerometerStandardDeviationXaxis | Time Domain: Body Accelerometer - Standard Deviation for X Axis
TimeBodyAccelerometerStandardDeviationYaxis | Time Domain: Body Accelerometer - Standard Deviation for Y Axis 
TimeBodyAccelerometerStandardDeviationZaxis | Time Domain: Body Accelerometer - Standard Deviation for Z Axis 
TimeGravityAccelerometerMeanXaxis | Time Domain: Gravity Accelerometer - Mean for X Axis 
TimeGravityAccelerometerMeanYaxis | Time Domain: Gravity Accelerometer - Mean for Y Axis 
TimeGravityAccelerometerMeanZaxis | Time Domain: Gravity Accelerometer - Mean for Z Axis 
TimeGravityAccelerometerStandardDeviationXaxis | Time Domain: Gravity Accelerometer - Standard Deviation for X Axis 
TimeGravityAccelerometerStandardDeviationYaxis | Time Domain: Gravity Accelerometer - Standard Deviation for Y Axis 
TimeGravityAccelerometerStandardDeviationZaxis | Time Domain: Gravity Accelerometer - Standard Deviation for Z Axis 
TimeBodyAccelerometerJerkMeanXaxis | Time Domain: Body Accelerometer Jerk - Mean for X Axis 
TimeBodyAccelerometerJerkMeanYaxis | Time Domain: Body Accelerometer Jerk - Mean for Y Axis
TimeBodyAccelerometerJerkMeanZaxis | Time Domain: Body Accelerometer Jerk - Mean for Z Axis 
TimeBodyAccelerometerJerkStandardDeviationXaxis | Time Domain: Body Accelerometer Jerk - Standard Deviation for X Axis
TimeBodyAccelerometerJerkStandardDeviationYaxis | Time Domain: Body Accelerometer Jerk - Standard Deviation for Y Axis
TimeBodyAccelerometerJerkStandardDeviationZaxis | Time Domain: Body Accelerometer Jerk - Standard Deviation for Z Axis 
TimeBodyGyroscopeMeanXaxis | Time Domain: Body Gyroscope - Mean for X Axis 
TimeBodyGyroscopeMeanYaxis | Time Domain: Body Gyroscope - Mean for Y Axis 
TimeBodyGyroscopeMeanZaxis | Time Domain: Body Gyroscope - Mean for Z Axis 
TimeBodyGyroscopeStandardDeviationXaxis | Time Domain: Body Gyroscope - Standard Deviation for X Axis 
TimeBodyGyroscopeStandardDeviationYaxis | Time Domain: Body Gyroscope - Standard Deviation for Y Axis 
TimeBodyGyroscopeStandardDeviationZaxis | Time Domain: Body Gyroscope - Standard Deviation for Z Axis 
TimeBodyGyroscopeJerkMeanXaxis | Time Domain: Body Gyroscope Jerk - Mean for X Axis 
TimeBodyGyroscopeJerkMeanYaxis | Time Domain: Body Gyroscope Jerk - Mean for Y Axis 
TimeBodyGyroscopeJerkMeanZaxis | Time Domain: Body Gyroscope Jerk - Mean for Z Axis 
TimeBodyGyroscopeJerkStandardDeviationXaxis | Time Domain: Body Gyroscope Jerk - Standard Deviation for X Axis 
TimeBodyGyroscopeJerkStandardDeviationYaxis | Time Domain: Body Gyroscope Jerk - Standard Deviation for Y Axis 
TimeBodyGyroscopeJerkStandardDeviationZaxis | Time Domain: Body Gyroscope Jerk - Standard Deviation for Z Axis 
TimeBodyAccelerometerMagnitudeMean | Time Domain: Body Accelerometer Magnitude - Mean 
TimeBodyAccelerometerMagnitudeStandardDeviation | Time Domain: Body Accelerometer Magnitude - Standard Deviation
TimeGravityAccelerometerMagnitudeMean | Time Domain: Gravity Accelerometer Magnitude - Mean 
TimeGravityAccelerometerMagnitudeStandardDeviation | Time Domain: Gravity Accelerometer Magnitude - Standard Deviation 
TimeBodyAccelerometerJerkMagnitudeMean | Time Domain: Body Accelerometer Jerk Magnitude - Mean 
TimeBodyAccelerometerJerkMagnitudeStandardDeviation | Time Domain: Body Accelerometer Jerk Magnitude - Standard Deviation 
TimeBodyGyroscopeMagnitudeMean | Time Domain: Body Gyroscope Magnitude - Mean 
TimeBodyGyroscopeMagnitudeStandardDeviation | Time Domain: Body Gyroscope Magnitude - Standard Deviation 
TimeBodyGyroscopeJerkMagnitudeMean | Time Domain: Body Gyroscope Jerk Magnitude - Mean 
TimeBodyGyroscopeJerkMagnitudeStandardDeviation | Time Domain: Body Gyroscope Jerk Magnitude - Standard Deviation 
FrequencyBodyAccelerometerMeanXaxis | Frequency Domain: Body Accelerometer - Mean for X Axis 
FrequencyBodyAccelerometerMeanYaxis | Frequency Domain: Body Accelerometer - Mean for Y Axis 
FrequencyBodyAccelerometerMeanZaxis | Frequency Domain: Body Accelerometer - Mean for Z Axis 
FrequencyBodyAccelerometerStandardDeviationXaxis | Frequency Domain: Body Accelerometer - Standard Deviation for X Axis 
FrequencyBodyAccelerometerStandardDeviationYaxis | Frequency Domain: Body Accelerometer - Standard Deviation for Y Axis 
FrequencyBodyAccelerometerStandardDeviationZaxis | Frequency Domain: Body Accelerometer - Standard Deviation for Z Axis 
FrequencyBodyAccelerometerJerkMeanXaxis | Frequency Domain: Body Accelerometer Jerk - Mean for X Axis 
FrequencyBodyAccelerometerJerkMeanYaxis | Frequency Domain: Body Accelerometer Jerk - Mean for Y Axis 
FrequencyBodyAccelerometerJerkMeanZaxis | Frequency Domain: Body Accelerometer Jerk - Mean for Z Axis 
FrequencyBodyAccelerometerJerkStandardDeviationXaxis | Frequency Domain: Body Accelerometer Jerk - Standard Deviation for X Axis 
FrequencyBodyAccelerometerJerkStandardDeviationYaxis | Frequency Domain: Body Accelerometer Jerk - Standard Deviation for Y Axis 
FrequencyBodyAccelerometerJerkStandardDeviationZaxis | Frequency Domain: Body Accelerometer Jerk - Standard Deviation for Z Axis 
FrequencyBodyGyroscopeMeanXaxis | Frequency Domain: Body Gyroscope - Mean for X Axis 
FrequencyBodyGyroscopeMeanYaxis | Frequency Domain: Body Gyroscope - Mean for Y Axis 
FrequencyBodyGyroscopeMeanZaxis | Frequency Domain: Body Gyroscope - Mean for Z Axis 
FrequencyBodyGyroscopeStandardDeviationXaxis | Frequency Domain: Body Gyroscope - Standard Deviation for X Axis 
FrequencyBodyGyroscopeStandardDeviationYaxis | Frequency Domain: Body Gyroscope - Standard Deviation for Y Axis 
FrequencyBodyGyroscopeStandardDeviationZaxis | Frequency Domain: Body Gyroscope - Standard Deviation for Z Axis 
FrequencyBodyAccelerometerMagnitudeMean | Frequency Domain: Body Accelerometer Magnitude - Mean 
FrequencyBodyAccelerometerMagnitudeStandardDeviation | Frequency Domain: Body Accelerometer Magnitude - Standard Deviation 
FrequencyBodyAccelerometerJerkMagnitudeMean | Frequency Domain: Body Accelerometer Jerk Magnitude - Mean 
FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation | Frequency Domain: Body Accelerometer Jerk Magnitude - Standard Deviation 
FrequencyBodyGyroscopeMagnitudeMean | Frequency Domain: Body Gyroscope Magnitude - Mean 
FrequencyBodyGyroscopeMagnitudeStandardDeviation | Frequency Domain: Body Gyroscope Magnitude - Standard Deviation 
FrequencyBodyGyroscopeJerkMagnitudeMean | Frequency Domain: Body Gyroscope Jerk Magnitude - Mean 
FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation| Frequency Domain: Body Gyroscope Jerk Magnitude - Standard Deviation 


