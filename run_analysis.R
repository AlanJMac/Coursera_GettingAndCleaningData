## ############################################ ##
## run_analysis.R                               ##
##                                              ##
## Coursera project: Getting and Cleaning Data  ##
## ############################################ ##
##                                              ##
## This script works on data collected from the ##
## accelerometers from the Samsung Galaxy S     ##
## smartphone.                                  ##
## It is designed to do the following:          ##
##     1. Merges the training and the test sets ## 
##        to create one data set.               ##
##     2. Extracts only the measurements on the ##
##        mean and standard deviation for each  ##
##        measurement.                          ##
##     3. Uses descriptive activity names to    ##
##        name the activities in the data set   ##
##     4. Appropriately labels the data set     ## 
##        with descriptive variable names.      ##
##     5. From the data set in step 4, creates  ##
##        a second, independent tidy            ##
##        data set with the average of each     ##
##        variable for each activity and each   ##
##        subject.                              ##
##                                              ##
## The required steps related to the Coursera   ##
## project highlighted in the code with the     ##
## relevant step number, e.g.                   ##
##      P1 Merge test and train datasets        ##
## ############################################ ##

## This is the main function for this script
run_analysis <- function(datasetDir = "./UCI_HAR_Dataset") {
    # Load required library
    library(dplyr)
    
    # Read the Activity labels file
    activityLabelsMap <- read.table(
        paste(datasetDir, "activity_labels.txt", sep="/"))
    
    # Read the Features labels file
    featuresLabelsMap <- read.table(
        paste(datasetDir, "features.txt", sep="/"))
    
    # Read test data
    xTestData <- read.table(
        paste(datasetDir, "test/X_test.txt", sep="/"))
    # Read training data
    xTrainData <- read.table(
        paste(datasetDir, "train/X_train.txt", sep="/"))
    
    # Create test data set
    testDataset <- 
        create_dataset(datasetDir, "test",
                       xTestData, activityLabelsMap, featuresLabelsMap)
    # Create train data set
    trainDataset <- 
        create_dataset(datasetDir, "train",
                       xTrainData, activityLabelsMap, featuresLabelsMap)
    ## ###
    ## P1. Merge test and train datasets
    ## ###
    #fullDataset <- merge(testDataset, trainDataset, all = TRUE)
    fullDataset <- rbind(testDataset, trainDataset)
    
    ## ###
    ## P2. Extract only the measurements on the mean 
    ##    and standard deviation for each measurement.
    ## ###
    # Get the column names for the desired features
    colNames <- character()
    for(i in featuresLabelsMap[,1]) {
        featureLabel <- read_label_from_index_map(featuresLabelsMap, i)
        if(length(grep("mean()", featureLabel, fixed=TRUE)) > 0 
           | length(grep("std()", featureLabel, fixed=TRUE)) > 0) {
            colNames <- c(colNames, featureLabel)
        }
    }
    # Extract data
     dataExtract <- fullDataset[,c("subject",
                                   "dataset",
                                   "activity",
                                   colNames)]
    
    ## ###
    ## P5. Creates a second, independent tidy data set with the 
    ##     average of each variable for each activity and each 
    ##      subject.
    ## ###
    ## Group by dataset("test" & "train", subject then activity
    dataExtract %>% 
        group_by(dataset, subject, activity) %>% 
            summarize_each(funs(mean))
    ## Make the column names more meaningfully accurate
    names(dataExtract) <- c(names(dataExtract)[1:3],
                            meaningful_name(names(dataExtract)[-1:-3]))
    
    ## Return tidy data set
    dataExtract
}

## Create a data set for a given type
## The data set will be in the form
## SUBJECT DATASET ACTIVITY DATA ...
create_dataset <- function(datasetDir, type, dataExtract, activityLabelsMap,
                           featuresLabelsMap) {
    subjectData <- read.table(paste(datasetDir, "/", type,
                                    "/subject_", type, ".txt", sep=""))
    names(subjectData) <- c("subject")
    
    activityData <- read.table(paste(datasetDir, "/", type,
                                    "/y_", type, ".txt", sep=""))

    ## ###
    ## P3. Use descriptive activity names to name the activities
    ##    in the data set - applied while creating datasets
    ## ###
    activityDataNamed <- mutate(activityData, 
                           activity = sapply(activityData[,1],
                                          read_label_from_index_map,
                                          labelIndexMap = activityLabelsMap))                           
    ## ###
    ## P4. Appropriately labels the data set with descriptive variable names.
    ## ###
    names(dataExtract) <- featuresLabelsMap[,2]
    # Merge
    cbind(subject = subjectData, dataset = type,
          activity = activityDataNamed[,2], dataExtract)
}

## Function to merge the specified data sets into
## one data set
merge_datasets <- function(trainingdata, testdata) {
    subjectTest <- read.table("./UCI_HAR_Dataset/test//subject_test.txt")
    xTest <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
    yTest <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
    
    cbind(subjectTest, xTest, yTest)
}

## From the labelIndexMap data frame (read previously from a file),
## get the name of the label for the given index number
read_label_from_index_map <- function(labelIndexMap, index) {
    as.character(labelIndexMap[labelIndexMap[,1] == index, 2])
}

## For the given data set extract the columns indicated by colNames
## and label the columns from the featuresLabelsMap
extract_columns <- function(data, featuresLabelsMap, colNames) {
    dataExtract <- data[,c(1:3,colNames)]
    
    
    # names(dataExtract[,4:length(colNames)]) <- colNames
    # Return extracted columns
    dataExtract
}

## Convert the provided label into a meaningful name based
## on the function applied to the dataset
## e.g. append 'average_' to the appropriate columns 
meaningful_name <- function(orginalLabel) {
    if(length(grep("mean()", orginalLabel, fixed=TRUE)) > 0 
       | length(grep("std()", orginalLabel, fixed=TRUE)) > 0) {
        paste("average", orginalLabel, sep="_")
    } else {
        orginalLabel
    }
}
