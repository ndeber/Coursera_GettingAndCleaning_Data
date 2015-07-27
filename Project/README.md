## Course Project: Coursera Getting And Cleaning Data 
Linked to this [Coursera course](https://www.coursera.org/course/getdata)

### What's in this repository
* Source data, in the subdirectory [UCI HAR Dataset](https://github.com/ndeber/Coursera_GettingAndCleaning_Data/tree/master/Project/UCI%20HAR%20Dataset)
* The script designed to pre-process the data
* The codebook describing the variables
* The tidy dataset, output of the script, in a txt format

### What is the data source about
The data linked to represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The data itself is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### How does the script work?
The script, called [run_analysis.R](), works in x steps
1. Import all source datasets (both train and test)
2. Merge train and test datasets to combine a unique larger set
3. Select the required features (i.e. specific measurements) related to the mean and standard deviations
4. Name all measurements and dimensions
5. Add the subject number and position description in the main dataset by merging with the corresponding source data
6. Summarize the data by taking the average of each measurement for each subject and position

### Codebook
The code book is in the repository and is called:
[Codebook.md](https://github.com/ndeber/Coursera_GettingAndCleaning_Data/blob/master/Project/Codebook.md)