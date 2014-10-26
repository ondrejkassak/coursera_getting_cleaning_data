Assignment
==========

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

Solution
=========

1. Merge the training and the test sets to create one data set.
---------------------------------------------------------------
At first we defined the variable storing path to dataset. It is used to simplify code when read data.
Then we read data from activity_labels and features files and set column names for activity_lables table.
We also read the test and train data and set them the column names. For both datasets (train, test) we bind 
their data by columns. Next we bind both datasets into common one by rows.

4. Appropriately label the data set with descriptive activity names.
--------------------------------------------------------------------
We label the dataset appropriately with descriptive names. We made it so far to have easier situation in part 2. and 3.

2. Extract only the measurements on the mean and standard deviation for each measurement.
-----------------------------------------------------------------------------------------
After naming the columns in dataset we created boolean vector containing TRUE value only for columns with mean, standard deviation and ids.
We used it to get the subset selected columns from above described joined dataset.

3. Use descriptive activity names to name the activities in the data set.
-------------------------------------------------------------------------
To get descriptive activity names instead of numbers we merged dataset with text names by activity_type attribute.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
--------------------------------------------------------------------------------------------------------------------
Last we created tidy table containing for every unique pair of activity and subject, the means of individual variables. Before this action we 
deleted the activity_labels column due to inability of making mean form text variable. After creation of tiny table, we added this column back.
We also printed the output into textfile named tidy.txt.
coursera_getting_cleaning_data

