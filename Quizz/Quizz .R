if(!file.exists("data")){
  dir.create("data")
}
setwd("Data")

##Q1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile = "Quizz1_data.csv")

install.packages("data.table")
library(data.table)
data <- read.table("Quizz1_data.csv", sep = ",", header = TRUE, na.strings ="NA", quote="")
data <- data.table(data)

data[data$VAL==24,.N, by=VAL]

##Q3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
install.packages("xlsx")
library(xlsx)
colIndex <- 7:15
rowIndex<-18:23
dat <- read.xlsx("DATA.gov_NGAP.xlsx",sheetIndex=1,header=TRUE,colIndex=colIndex,rowIndex=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T) 

##Q4 XML
install.packages("XML")
library(XML)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
fileName <- "getdata_data_restaurants.xml"
doc <- xmlTreeParse(fileName,useInternal= TRUE)
rootNode <- xmlRoot(doc)
zipCodes <-as.numeric(xpathSApply(rootNode,"//zipcode",xmlValue))
table(zipCodes)

##Q5
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile = "MicroSurvey.csv")
DT<-fread("MicroSurvey.csv")
tapply(DT$pwgtp15,DT$SEX,mean)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15) 
DT[,mean(pwgtp15),by=SEX]
sapply(split(DT$pwgtp15,DT$SEX),mean) 
mean(DT$pwgtp15,by=DT$SEX) #No


### Quizz 2
##Q1


##Q2
library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile = "Quizz2_data.csv")
acs <- read.table("Quizz2_data.csv", sep = ",", header = TRUE, na.strings ="NA", quote="")
sqldf("select pwgtp1 from acs where AGEP < 50")

##Q3
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")

##Q4
fileUrl <- "http://biostat.jhsph.edu/~jleek/contact.html"
download.file(fileUrl,destfile = "Quizz2_site.html")
site2 <- read.fwf("Quizz2_site.html",20000)
table<-data.frame(site2)
nchar(as.character(table[c(10,20,30,100),]))
as.character(table[100,])


##Q5
fileUrl <- "http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"
download.file(fileUrl,destfile = "Quizz2_data2.txt")
table<- read.fwf("Quizz2_data2.txt", widths=c(12,7,4, 9,4, 9,4, 9,4),skip=4)
