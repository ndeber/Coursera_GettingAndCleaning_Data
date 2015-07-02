if(!file.exists("data")){
  dir.create("data")
}
setwd("Data")

##Q1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile = "Quizz1_data.csv")

library(data.table)
data <- read.table("Quizz1_data.csv", sep = ",", header = TRUE, na.strings ="NA", quote="")
data <- data.table(data)

data[data$VAL==24,.N, by=VAL]

##Q3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
library(xlsx)
colIndex <- 7:15
rowIndex<-18:23
dat <- read.xlsx("DATA.gov_NGAP.xlsx",sheetIndex=1,header=TRUE,colIndex=colIndex,rowIndex=rowIndex)