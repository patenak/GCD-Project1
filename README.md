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


Instructions:
=============

1) Download UCI HAR Dataset archive (UCI HAR Dataset.zip) from following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2) Unzip archive and move the following files to your working directory:

features.txt, X_test.txt, subject_test.txt, y_test.txt, X_train.txt, subject_train.txt, y_train.txt

3)Copy run_analysis.R to your working directory

4)Source run_analysis.R to create tidy data set

**NOTE:  A text file named HARmeantidy.txt will be created. This file can be re-read into R using:** `read.table("HARmeantidy.txt", header = TRUE)`