library(data.table)

data_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

data_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

data_merged <- rbind(data_train,data_test)
activity_merged <- rbind(activity_train,activity_test) 
subjects_merged <- rbind(subjects_train,subjects_test)

remove(data_test,activity_train,activity_test, subjects_train,subjects_test)
##add this data_train

features_needed <- features[grepl("mean()",features[,2])|grepl("std()",features[,2]),]
data_merged_reduced <- data_merged[,features_needed[,1]] ##Change here##

colnames(data_merged_reduced) <- as.vector(features_needed[,2])
colnames(subjects_merged) <- "Subjects"
colnames(activity_merged) <- "ActivityNb"
colnames(activity_labels) <- c("ActivityNb","Activity")

data_merged_enriched <- cbind(subjects_merged,activity_merged,data_merged_reduced)
tidy_dataset<- merge(x=activity_labels,y=data_merged_enriched,by = "ActivityNb")
tidy_dataset <- data.table(tidy_dataset)
tidy_dataset[,ActivityNb:=NULL]

tidy_dataset2 <- tidy_dataset[, lapply(.SD, sum, na.rm=TRUE), by=list(Activity,Subjects)]

remove(features_needed,data_merged_reduced,data_merged_enriched,subjects_merged,activity_merged,activity_labels,features)
##add this data_merged





