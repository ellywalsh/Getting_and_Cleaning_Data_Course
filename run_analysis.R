## This script will create a tidy data set from the accelerometers data set
## Data are first read in from locally saved files.

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                           sep = " ", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

# Combine the train and test data sets by binding test rows to the end of train

all_subject <- rbind(subject_train, subject_test)
all_x <- rbind(x_train, x_test)
all_y <- rbind(y_train, y_test)

# Select only mean and stddev measurements

all_x <- select(all_x, c(V1:V6, V41:V46, V81:V86, V121:V126, V161:V166, V201:V202, 
                         V240:V241, V253:V254, V266:V271, V345:V350, V424:V429, V503:V504, 
                         V516:V517, V529:V530, V542:V543))

# Add activity column and subject column to the beginning of the x data.

all_data <- cbind(all_y, all_x)
all_data <- cbind(all_subject, all_data)

# Give columns descriptive names

colnames(all_data) <- c("Subject", "Activity", "Mean T Body Acceleration X", 
                        "Mean T Body Acceleration Y", "Mean T Body Acceleration Z", 
                        "Std Dev T Body Acceleration X", "Std Dev T Body Acceleration Y", 
                        "Std Dev T Body Acceleration Z", "Mean T Gravity Acceleration X", 
                        "Mean T Gravity Acceleration Y", "Mean T Gravity Acceleration Z", 
                        "Std Dev T Gravity Acceleration X", "Std Dev T Gravity Acceleration Y", 
                        "Std Dev T Gravity Acceleration Z", "Mean T Body Acceleration Jerk X", 
                        "Mean T Body Acceleration Jerk Y", "Mean T Body Acceleration Jerk Z", 
                        "Std Dev T Body Acceleration Jerk X", "Std Dev T Body Acceleration Jerk Y", 
                        "Std Dev T Body Acceleration Jerk Z", "Mean T Body Gyro X", 
                        "Mean T Body Gyro Y", "Mean T Body Gyro Z", "Std T Body Gyro X", 
                        "Std T Body Gyro Y", "Std T Body Gyro Z", "Mean T Body Gyro Jerk X", 
                        "Mean T Body Gyro Jerk Y", "Mean T Body Gyro Jerk Z", 
                        "Std T Body Gyro Jerk X", "Std T Body Gyro Jerk Y", 
                        "Std T Body Gyro Jerk Z", "Mean T Body Acceleration Mag", 
                        "Std T Body Acceleration Mag", "Mean T Body Gyro Mag", 
                        "Std T Body Gyro Mag", "Mean T Body Gyro Jerk Mag", 
                        "Std T Body Gyro Jerk Mag", "Mean F Body Acc X", 
                        "Mean F Body Acceleration Y", "Mean F Body Acceleration Z", 
                        "Std F Body Acceleration X", "Std F Body Acceleration Y", 
                        "Std F Body Acceleration Z", "Mean F Body Acceleration Jerk X", 
                        "Mean F Body Acceleration Jerk Y", "Mean F Body Acceleration Jerk Z", 
                        "Std Dev F Body Acceleration Jerk X", "Std Dev F Body Acceleration Jerk Y", 
                        "Std Dev F Body Acceleration Jerk Z", "Mean F Body Gyro X", 
                        "Mean F Body Gyro Y", "Mean F Body Gyro Z", "Std F Body Gyro X", 
                        "Std F Body Gyro Y", "Std F Body Gyro Z", "Mean F Body Acceleration Mag", 
                        "Std F Body Acceleration Mag", "Mean F Body Gyro Mag", 
                        "Std F Body Gyro Mag", "Mean F Body Gyro Jerk Mag", "Std F Body Gyro Jerk Mag",
                        "Mean F Body Body Gyro Jerk Mag", "Std F Body Body Gyro Jerk Mag")

#Replace activity with a true/false that sets it to the appropriate activity based on 1-6.

all_data <- all_data %>% mutate(Activity = factor(Activity, labels = c("Walking", "Walking Upstairs", 
                                                                 "Walking Downstairs", "Sitting",
                                                                 "Standing", "Laying")))

# Part 5: Creation of a new tidy data set with the average for each activity and subject

avg_data <- all_data %>% group_by(Subject, Activity) %>% summarize_all(mean)
write.table(avg_data, "Accelerometer_Average_Data", row.name = FALSE)
