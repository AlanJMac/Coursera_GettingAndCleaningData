# Coursera_GettingAndCleaningData
This is the README.md file for the Coursera course project for the course "Getting and Cleaning Data"
https://class.coursera.org/getdata-034

### Project Contents
This project consists of the following files:
 - README.md - this file describing the project
 - CodeBook.txt - code book file describing the variables in the data produced by running this code
 - run_analysis.R - the file containing the R script

### Purpose
The purpose of this script is to create a tidy data set from data collected from the accelerometers from the Samsung Galaxy S smartphone as described in this website: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script has been designed to work solely on the data set downloaded from this URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
### Requirements
This script requires the dplyr R package to run.

### Functions
#### run_analysis
This is the main function of the script.
By default this function assumes that the workspace in which it is running contains the UCI_HAR_Dataset. Alternatively the path to the data set directory may be specified as a parameter.
The steps this script follows are:
 1. Read the files from the data set containing the activity and features labels
 2. Reads the test and train data files
 3. Creates tidy test and train data sets by combining the separated subject, activity and data files
 4. Merges the test and train data sets into one
 5. Extracts into a subset data set from the combined data set only those columns which include the mean and standard deviation values
 6. Groups the data set by data set type ("train", "test"), by subject and by activity and calculates the mean average of the values in the other colums based on this grouping
 7. Returns this tidy data set

#### create_dataset
This is an auxiliary function.
This function takes a set of data for a specified data set type (i.e "test" or "train")  and creates a tidy data set combining the subject, activity (named) and data from the separate files.

#### merge_datasets
This function takes the created tidy test and train data sets and merges them into one tidy data set.

#### read_label_from_index_map
This is an auxiliary function.
The features file which has been read into a mapping of column indices and feature label is passed as an argument to this function along with the desired column index in order to return the name of that feature column label.

#### extract_columns
This function creates a sub set of the data set provided as a parameter to the function based on the provided column label names.

#### meaningful_name
This is an auxiliary function.
This function appends the text "average_" to the label names for the columns in which an average has been taken while preparing the final tidy data set.
