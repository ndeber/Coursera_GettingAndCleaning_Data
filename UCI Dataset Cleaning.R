data_train <- read.table("~/UCI HAR Dataset/train/x_train.txt")
activities_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", header = TRUE)

data_test <- read.table("~/UCI HAR Dataset/test/x_test.txt")
activities_test <- read.table("~/UCI HAR Dataset/train/y_test.txt", header = TRUE)

subjects <- read.table("~/UCI HAR Dataset/train/subject_train.txt", header = TRUE)
features <- read.table("~/UCI HAR Dataset/features.txt", header = TRUE)
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt")