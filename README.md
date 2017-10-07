# Getting-and-Cleaning-Data-Course-Project

The 'run_analysis.R' script will process the the original data in './data/Samsung' folder:

X_test.txt
X_train.txt

Then the R script handle the activity, which comes from below file

y_test.txt
y_train.txt

And also the subject from below file

subject_test
subject_train

Then combine the activity and subject and orginal merged test and train data set into one data frame

There is also a step in the R script to extracts only the measurements on the mean and standard deviation for each measurement and use descriptive names for the variables.
In another step, the R script use descriptive activity names to substitute the orginal code.

At last, the R script output the tidy data that the assginment requires:

Concerned_data.csv              (the measurements on the mean and standard deviation for each measurement) 
Mean_Concerned_data.csv     (the average of each variable for each activity and each subject from above dataset)
