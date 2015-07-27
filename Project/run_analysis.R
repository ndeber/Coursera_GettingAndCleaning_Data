## Import all source datasets
data_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

data_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## Merge Train and Test datasets for measures, activities and subjects
data_merged <- rbind(data_train,data_test)
activity_merged <- rbind(activity_train,activity_test) 
subjects_merged <- data.frame(rbind(subjects_train,subjects_test))
subjects_merged$V1 <- factor(subjects_merged$V1)

##Remove unnecessary sets
remove(data_test,activity_train,activity_test, subjects_train,subjects_test)

## Select required features (all Means and Standard deviations)
features_needed <- features[grepl("mean()",features[,2])|grepl("std()",features[,2]),]
data_merged_reduced <- data_merged[,features_needed[,1]] ##Change here##

##Name all measures
colnames(data_merged_reduced) <- as.character(features_needed[,2])
colnames(subjects_merged) <- "Subjects"
colnames(activity_merged) <- "ActivityNb"
colnames(activity_labels) <- c("ActivityNb","Activity")

## Combine measurement with activities and subjects names
data_merged_enriched <- cbind(subjects_merged,activity_merged,data_merged_reduced)
tidy_dataset<- merge(x=activity_labels,y=data_merged_enriched,by = "ActivityNb")
tidy_dataset$ActivityNb<-NULL

## Compute the average of each measurement per Activity and Subject
tidy_dataset_average <- aggregate(data=tidy_dataset,.~Activity+Subjects,FUN=mean, na.rm=TRUE)

##Clean workspace
remove(features_needed,data_merged_reduced,data_merged_enriched,subjects_merged,activity_merged,activity_labels,features)

## Describe output
head(tidy_dataset_average)
str(tidy_dataset_average)
summary(tidy_dataset_average)
write.table(tidy_dataset_average,file="TidyDataset_average.txt")
