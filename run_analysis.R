#Code for the Coursera Getting and Cleaning Data Course Project
#Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#Instructions: 
#1-Merges the training and the test sets to create one data set.
#2-Extracts only the measurements on the mean and standard deviation for each measurement. 
#3-Uses descriptive activity names to name the activities in the data set
#4-Appropriately labels the data set with descriptive variable names. 
#5-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###################################################################################
# The R script runs as follow:
#Step1: Read training and test sets
tablA1 <- read.table("C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/X_train.txt", header = FALSE, fill = TRUE)
tablA2 <- read.table("C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/X_test.txt" )

tablB1 <- read.table("C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/subject_train.txt", header = FALSE, fill = TRUE)
tablB2 <- read.table("C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/subject_train.txt", header = FALSE, fill = TRUE)

tablC1 <- read.table("C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/Y_train.txt", header = FALSE, fill = TRUE)
tablC2 <- read.table("C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/Y_test.txt", header = FALSE, fill = TRUE)

#Step2: Merge training and test sets into one data set
A <- rbind(tablA1, tablA2)
B <- rbind(tablB1, tablB2)
C <- rbind(tablC1, tablC2)

#Step3: Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/features_info.txt")
GoodFeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, GoodFeatures]
names(X) <- features[GoodFeatures, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

#Step4: Use descriptive activity names to name the activities in the data set.
varnames <- read.table("C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/activity_labels.txt")
varnames [, 2] = gsub("_", "", tolower(as.character(varnames[, 2])))
Y[,1] = varnames[Y[,1], 2]
names(Y) <- "activity"

#Step5: Label the data set with descriptive activity names.
names(S) <- "subject"
MergedData<-cbind(A, B, C)
write.table(MergedData, "C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/MergedData.txt")

#Step6: Create a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(MergedData)[2]
result = MergedData[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- MergedData[MergedData$subject==s & MergedData$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "C:/Users/DEGNINOU/Desktop/Data Science/UCI HAR Dataset/AveragesData.txt")
