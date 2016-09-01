# README 
Coursera: Getting and Cleaning Data Course Project

## Goal of script

The data linked to from the course website represent data collected from the accelerometers from the 
Samsung Galaxy S smartphone. 
The experiments have been carried out with a group of 30 volunteers (Subjects) within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist.
The features (variables) of each activity carried out by a person (SubjectActivity) is measured multiple times. 

	The data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	
	More details on the data can be found on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Used Software
Used R studio Version 0.99.893 – © 2009-2016 RStudio, Inc.

## Used Hardware
MacBookPro5,1, Intel Core 2 Duo, 2,4 GHz, 2 Cores, 8 GB Memory

## Script
Execute the script run_analysis.R

## Output tables
### SubjectActivityFeature
This table (data.frame) contains for each SubjectActivity 1 row (total 10299 rows)containing 88 columns. These columns are:

* SubjectID Type Integer: describing the volunteers wearing the smartphones
* ActivityName Type Factor: describing the name of the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
* All relevant Variables (86) Type num: containing only the measurements on the mean and standard deviation for each measurement. The names of the remaining relevant variables are made unique, but are for clarity reasons not modified. (See the file features.txt in the original datafile)

### SubjectActivityFeature_avg
This table (data.frame) contains for each SubjectActivity the averages on all variables. The columndefinition is identical to the SubjectActivityFeature table. The average transformation results in a 180 row, 88 column file.

## Author of script and documentation
Lars Hulzebos 2016-09-01

## Credits
* On the data: Reyes-Ortiz et al.
* On the course: Peng et al.
