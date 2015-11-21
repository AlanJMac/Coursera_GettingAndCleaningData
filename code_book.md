#Code Book
The data set created as a result of this script is calculated from the data collected by the project on this website: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
And explicitly calculate from the data set provided at this URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of experiment from which the data set has been created
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
#### Reference
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


## Feature Selection and units in original data set
- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
- Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
- Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

## Transformations applied
The data set created as an output from this script groups the average value for 
the mean and standard deviations of each observation calculated per subject per activity.

The original data set contains some features for which a mean value has been calculated but not a standard deviation and
therefore have not been considered for inclusion in the final tidy data set (based on the instructions given
for the Coursera project which has defined this script - https://class.coursera.org/getdata-034).

These features are:

- meanFreq()
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Tidy Data Set Variables - Output
The data set created as an output from this script has the following columns where the average value for 
the mean and standard deviations of each observation has been calculated per subject per activity:

- "dataset"  - whether the data for this observation originally came from the "test" or "train" data set
- "subject" - the subject identifier for this observation
- "activity"  - the activity label for this observation
- "average_tBodyAcc-mean()-X" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAcc-mean()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAcc-mean()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAcc-std()-X" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAcc-std()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAcc-std()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tGravityAcc-mean()-X" - average value for this measurement for a given subject doing a given activity
- "average_tGravityAcc-mean()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tGravityAcc-mean()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tGravityAcc-std()-X" - average value for this measurement for a given subject doing a given activity
- "average_tGravityAcc-std()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tGravityAcc-std()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccJerk-mean()-X" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccJerk-mean()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccJerk-mean()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccJerk-std()-X" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccJerk-std()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccJerk-std()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyro-mean()-X" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyro-mean()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyro-mean()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyro-std()-X" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyro-std()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyro-std()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroJerk-mean()-X" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroJerk-mean()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroJerk-mean()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroJerk-std()-X" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroJerk-std()-Y" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroJerk-std()-Z" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccMag-mean()" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccMag-std()" - average value for this measurement for a given subject doing a given activity
- "average_tGravityAccMag-mean()" - average value for this measurement for a given subject doing a given activity
- "average_tGravityAccMag-std()" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccJerkMag-mean()" - average value for this measurement for a given subject doing a given activity
- "average_tBodyAccJerkMag-std()" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroMag-mean()" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroMag-std()" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroJerkMag-mean()" - average value for this measurement for a given subject doing a given activity
- "average_tBodyGyroJerkMag-std()" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAcc-mean()-X" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAcc-mean()-Y" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAcc-mean()-Z" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAcc-std()-X" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAcc-std()-Y" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAcc-std()-Z" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAccJerk-mean()-X" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAccJerk-mean()-Y" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAccJerk-mean()-Z" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAccJerk-std()-X" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAccJerk-std()-Y" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAccJerk-std()-Z" - average value for this measurement for a given subject doing a given activity
- "average_fBodyGyro-mean()-X" - average value for this measurement for a given subject doing a given activity
- "average_fBodyGyro-mean()-Y" - average value for this measurement for a given subject doing a given activity
- "average_fBodyGyro-mean()-Z" - average value for this measurement for a given subject doing a given activity
- "average_fBodyGyro-std()-X" - average value for this measurement for a given subject doing a given activity
- "average_fBodyGyro-std()-Y" - average value for this measurement for a given subject doing a given activity
- "average_fBodyGyro-std()-Z" - average value for this measurement for a given subject doing a given activity
- "average_fBodyAccMag-mean()"  - average value for this measurement for a given subject doing a given activity
- "average_fBodyAccMag-std()" - average value for this measurement for a given subject doing a given activity
- "average_fBodyBodyAccJerkMag-mean()" - average value for this measurement for a given subject doing a given activity
- "average_fBodyBodyAccJerkMag-std()" - average value for this measurement for a given subject doing a given activity
- "average_fBodyBodyGyroMag-mean()" - average value for this measurement for a given subject doing a given activity
- "average_fBodyBodyGyroMag-std()" - average value for this measurement for a given subject doing a given activity
- "average_fBodyBodyGyroJerkMag-mean()" - average value for this measurement for a given subject doing a given activity
- "average_fBodyBodyGyroJerkMag-std()" - average value for this measurement for a given subject doing a given activity
