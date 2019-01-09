## This script will create a tidy data set from the accelerometers data set.
## Training and test data are merged. Only data relating to means and standard
## deviations are extracted. Descriptive variable names from the "features.txt"
## file and descriptive activity names from the "activity_labels.txt" file
## are added. Variables are then averaged by activity and by subject and stored
## in the "Average Accelerometer Data Set."

## Data are first read in from locally saved files.

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                           sep = " ", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Combine the train and test data sets by binding test rows to the end of train

all_subject <- rbind(subject_train, subject_test)
all_x <- rbind(x_train, x_test)
all_y <- rbind(y_train, y_test)
names(all_x) <- features[,2]

# Select only mean and stddev measurements

mean_std <- all_x[(grepl("mean", names(all_x)) | (grepl("std", names(all_x))))]

# Add activity column and subject column to the beginning of the x data.

all_data <- cbind(all_y, mean_std)
all_data <- rename(all_data, Activity = V1)
all_data <- cbind(all_subject, all_data)
all_data <- rename(all_data, Subject = V1)

#Replace activity with a true/false that sets it to the appropriate activity based on 1-6.

all_data <- all_data %>% mutate(Activity = factor(Activity, labels = activities[,2]))

# Part 5: Creation of a new tidy data set with the average for each activity and subject

avg_data <- all_data %>% group_by(Subject, Activity) %>% summarize_all(mean)
write.table(avg_data, "Accelerometer_Average_Data", row.name = FALSE)
