setwd("C:/Users/LoveDoves/Desktop/R Working Directory/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test")
x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
merged_test <- cbind(y_test, subject_test, x_test)
merged_train <- cbind(y_train, subject_train, x_train)
merged_train_test <- rbind(merged_test, merged_train)
features <- read.table("features2.txt")
colnames(merged_train_test) <- features[,2]
only_mean_and_sd <- merged_train_test[ , grepl( "Activity|Subject|-mean[()]|-std()", names( merged_train_test ) ) ]
only_mean_and_sd$Activity <- as.numeric(as.character(only_mean_and_sd$Activity)) 
activities <- c(Walking = 1, Walking_upstairs = 2, Walking_downstairs = 3, Sitting = 4, Standing = 5, Lying_down = 6)
only_mean_and_sd$Activity <- names(activities)[match(only_mean_and_sd$Activity, activities)]
features_updated <- read.table("features3.txt")
colnames(only_mean_and_sd) <- features_updated[,2]
library(reshape2)
Molten <- melt(only_mean_and_sd, id.vars = c("Subject", "Activity"))
abc <- dcast(Molten, Subject + Activity ~ variable, fun = mean)
