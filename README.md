### getdata_009_project
===================

#### Github repo with the comments and code for performing the analysis required in Getting and Cleaning Data 009 Course Project.
```
## Part 1 of course project, merge train and test sets to create one data set

## set working directory, make sure all the files you need are in there using dir()

## Use read.table to read the .txt files into R, assign them names

x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

## Use Notepad++ to actually see the data frames.  It appears there are no column names and no row labels.
## Use ncol(), nrow(), class(), and str() to examine your objects
## Each test data frame has 2947 rows.  x_test has 561 columns, y_test has one column, and subject_test has one column
## Each train data frame has 7352 rows.  x_train has 561 columna, y_train has one column, and subject_train has one column


## use cbind to bring the three test data sets together.  
## cbind in this order:  y_test, subject_test, then x_test.  y-test will eventually become our row labels, so put it leftmost in the merged data frame

merged_test <- cbind(y_test, subject_test, x_test)


## use cbind to bring the three train data sets together in the same manner and order as the test data
## cbind in this order:  y_train, subject_train, then x_train.

merged_train <- cbind(y_train, subject_train, x_train)

## Bind train data to the test data using rbind

merged_train_test <- rbind(merged_test, merged_train)

## merged_train_test is the one data set for part 1 of the course project.  There are no column and row names yet.

## Part 2 of the course project, extract only the measurements on the mean and standard deviation for each of the 10299 rows or measurements

## First, add column names 

## For column 1, the column name will be "Activity".  

## For column 2, the column name will be "Subject".

## For the remaining 561 columns, the  names  are in the file features.txt.  
## I modified features.txt to add "Activity" and "Subject" to the top of the list, so I have 563 items listed, one item for each column in my merged_train_test data frame.
## I renamed the file features2.txt and then made the 563 entries into the column names for my data frame using colnames

features <- read.table("features2.txt")
colnames(merged_train_test) <- features[,2]

## use grepl to select the desired columns:  Activity, Subject, and those whose names contain mean and std, but not meanFreq, Accmean, and gravityMean

only_mean_and_sd <- merged_train_test[ , grepl( "Activity|Subject|-mean[()]|-std()", names( merged_train_test ) ) ]

## Part 3 of the course project, uses descriptive activity names to name the activities in the data set.

## Activity column contains integers, so we need to make it numeric

only_mean_and_sd$Activity <- as.numeric(as.character(only_mean_and_sd$Activity)) 

## substitute in the activity description in place of the existing numbers 1:6.  Details are in the Codebook

activities <- c(Walking = 1, Walking_upstairs = 2, Walking_downstairs = 3, Sitting = 4, Standing = 5, Lying_down = 6)
only_mean_and_sd$Activity <- names(activities)[match(only_mean_and_sd$Activity, activities)]

## Part 4 of the course project, appropriately labels the data set with descriptive variable names

## Excepting Activity and Subject columns, then working only with the names of the columns that have mean and std in them, I used Notead++ to write new descriptive variable names
## read in text file with new descriptive names, features3.txt

features_updated <- read.table("features3.txt")

## rename columns with new descriptive variable names deatiled in Codebook

colnames(only_mean_and_sd) <- features_updated[,2]

## Part 5 of the course project, create a second independent tidy data set with the average of each variable for each activity for each subject
## I used the reshape2 package, so first we use library, then melt, then dcast

> library(reshape2)
> Molten <- melt(only_mean_and_sd, id.vars = c("Subject", "Activity"))
> abc <- dcast(Molten, Subject + Activity ~ variable, fun = mean)

## The result is a data frame with 180 observations (30 subjects by 6 activities) and 68 columns (Subject, Activity, and the 66 variables with either mean or std)
```
