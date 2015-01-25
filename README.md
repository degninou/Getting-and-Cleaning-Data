# Getting-and-Cleaning-Data (Coursera Course)
##This is the repository for Project codes
###Please follow these instruction
*Download and unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
into a folder on your local drive, say C:\Users\yourname\Documents\R\
*Put run_analysis.R to C:\Users\yourname\Documents\R\UCI HAR Dataset\
*In RStudio: setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\") and then: source("run_analysis.R")
*R will run the script: read the dataset and write these files:
MergedData.txt and AveragesData.txt
Use data <- read.table("AveragesData.txt") to read the latter. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30*6=180 rows. 
