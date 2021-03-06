# README

Average Accelerometer Data Set

A tidy data set derived from: 

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Analyses performed:
Data from the original data set was transformed. Training and test data sets were combined and all 77 standard deviation and mean features were isolated from the data set. These were then grouped by subject and by activity. An average value for each feature for each activity by subject was calculated. 

For each record it is provided:
======================================

- Averages of mean and standard deviations of triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration calculated per subject per activity..
- Averages of mean and standard deviations of triaxial Angular velocity from the gyroscope calculated per subject per activity.
- A 77-feature vector with time and frequency domain variables which includes all mean and standard deviation measurements from the original data set. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README_average.rtf’

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features included in Average data set.

- 'activity_labels.txt': Links the class labels with their activity name.

- ‘runanalysis.R’: Script used to tidy raw data

- ‘Accelerometer Average Data’: Tidy data set of average feature values by activity and subject.

Description of original raw data set:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
