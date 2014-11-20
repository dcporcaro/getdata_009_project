#### Codebook for getdata009 Course Project
##### The raw data was assembled from 6 files, as detailed below
##### The Subjects and Activities became the first two columns.  
* Subjects were the people who participated in the study, numbered one to 30.  This was not changed in going from raw to tidy.  There are 30 numeric entries of the class integer.
* Activities were the six things the Subjects did as measurements were collected.  There are six choices of the class character.

###### The original names of the Activities were in a text file, and were represented in the raw data numerically as follows:
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

###### These were renamed as follows:
* Walking = 1, 
* Walking_upstairs = 2, 
* Walking_downstairs = 3, 
* Sitting = 4, 
* Standing = 5, 
* Lying_down = 6

##### The measurements were renamed to expand abbreviations and remove non-alphabetic characters.  
* If a measurement had “t” at the beginning, it now reads “Time” 
* If a measurement had “f” at the beginning, it now reads “FFT” for Fast Fourier Transformation
* If a measurement was a mean, the “-mean()” was replaced with “Mean”
* If a measurement was a standard deviation, the “-std()” was replaced with “SD”
##### The measurements in the tidy data were computed as averages for each activity and subject.  They are all numeric.
###### The raw data was collected from the accelerometer and gyroscope 3-axial raw signals.  Each axis represented data in the X, Y, or Z direction.  The data was provided in six different files, three for test and three for train
##### The three raw test data files had data as follows: 
* y_test  contained a numeric representation of an activity, such as walking or sitting.  The numbers ranged from 1 to 6 to correspond with the six monitored activities, named below
* subject_test contained a numeric representation for each participant.  The numbers ranged from one to 24
* x_test contained the measurements from the accelerometer and gyroscope, as well as mathematical derivations from those measurements.  There were 561 variables, and 2947 measurements of those variables.  
##### While I loaded all in originally, I was only concerned with mean and standard deviation, and eventually reduced the number of variables as I created a tidy data set
##### The three raw train data files had data as follows: 
* y_train  contained a numeric representation of an activity, such as walking or sitting.  The numbers ranged from 1 to 6 to correspond with the six monitored activities, named below
* subject_train contained a numeric representation for each participant.  The numbers ranged from one to 24
* x_train contained the measurements from the accelerometer and gyroscope, as well as mathematical derivations from those measurements.  There were 561 variables, and 7352 measurements of those variables.  
#####  While I loaded all in originally, I was only concerned with mean and standard deviation, and eventually reduced the number of variables as I created a tidy data set


### **The original raw data variable names**
##### The original names contained abbreviations and characters that made them hard to read.  An example (the complete list is at the bottom of this document)
* tBodyAccJerkMag
* fBodyBodyAccJerkMag
##### the prefix “t” or “f” represented either a time measurement or a Fast Fourier Transformation
##### The set of variables for mean and standard deviation that were estimated from these signals were represented in the raw data with suffixes as follows: 
* mean(): Mean value
* std(): Standard deviation
##### An example
* tBodyGyroJerkMag-mean()
##### Finally, if a dimension was represented, it was added with a hyphen and a letter, X, Y, or Z
* tBodyAccJerk-mean()-X



#### Original Raw data variable names
##### The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
* tAcc-XYZ  accelerometer 3-axial raw signals
* tBodyAcc-XYZ   acceleration signal was then separated into body acceleration signals 
* tBodyAccJerk-XYZ   the body linear acceleration was  derived in time to obtain Jerk signals
* tBodyAccMag  magnitude of tBodyAcc-XYZ signals were calculated using the Euclidean norm
* tBodyAccJerkMag  magnitude of tBodyAccJerk-XYZ signals were calculated using the Euclidean norm
* tGravityAcc-XYZ  acceleration signal was then separated by gravity acceleration signals 
* tGravityAccMag  the magnitude of tGravityAcc-XYZ  signals were calculated using the Euclidean norm
* tGyro-XYZ    gyroscope 3-axial raw signals
* tBodyGyro-XYZ body angular velocity
* tBodyGyroJerk-XYZ  the body angular velocity was derived in time to obtain Jerk signals 
* tBodyGyroMag  the magnitude of tBodyGyro-XYZ was calculated using the Euclidean norm
* tBodyGyroJerkMag  the magnitude tBodyGyroJerk-XYZ  was calculated using the Euclidean norm

#### Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

##### The set of variables that were estimated from these signals are below.  For the tidy data, I retained only “mean()” and “std()” 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

##### Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean



