## Read in the test and train data set.
test <- read.fwf("./data/Samsung/X_test.txt",widths = rep(16,561))
train <- read.fwf("./data/Samsung/X_train.txt",widths = rep(16,561))

## Merge the test and train data set
data <- rbind(test, train)

## Select only the concerned mean, std of the measurement.
data1 <- select(data,V1:V6,V41:V46,V81:V86,V121:V126,V161:V166,V201:V202,V214:V215,V227:V228,V240:V241,V253:V254,V266:V271,V345:V350,V424:V429,V503:V504,V516:V517,V529:V530,V542:V543)

## Save the feature names that to be retained in the data1 data set in a text file name 'Variable.txt'
features <- read.csv("./data/Samsung/Variables.txt", header = FALSE, sep = " ")

## Label the data set with descriptive variable names.
names(data1) <- features[,2]

## Compose and combine the test and train activity vector
test_act <- read.fwf("./data/Samsung/y_test.txt",widths = 1)
train_act <- read.fwf("./data/Samsung/y_train.txt",widths = 1)
activity <- rbind(test_act,train_act)

## Change the activity label to actual activity name
for(i in 1:10299) {
    if (activity[i,1]==1) activity[i,1] <- "WALKING"
    if (activity[i,1]==2) activity[i,1] <- "WALKING_UPSTAIRS"
    if (activity[i,1]==3) activity[i,1] <- "WALKING_DOWNSTAIRS"
    if (activity[i,1]==4) activity[i,1] <- "SITTING"
    if (activity[i,1]==5) activity[i,1] <- "STANDING"
    if (activity[i,1]==6) activity[i,1] <- "LAYING"
}

## Incorporate 'Activity' into the merged data set
data2 <- cbind(activity,data1)
names(data2)[1] <- "Activity"

## Compose and combine the test and train Subject vector
test_subject <- read.fwf("./data/Samsung/subject_test.txt",widths = 2)
train_subject <- read.fwf("./data/Samsung/subject_train.txt",widths = 2)
subject <- rbind(test_subject,train_subject)

## Incorporate 'Subject' into the merged data set, name it Concerned_data 
Concerned_data <- cbind(subject,data2)
names(Concerned_data)[1] <- "Subject"

## Output the Concerned_data
write.csv(Concerned_data,file = "./data/Concerned_data.csv")

## Group by Subject and Activity, then summarize the mean of each variable
## Name it as Mean_Concerned_data

data3 <- group_by(Concerned_data,Subject,Activity)
Mean_Concerned_data <- summarise_all(data3, mean)

## Output the Mean_Concerned_data
write.csv(Mean_Concerned_data,file = "./data/Mean_Concerned_data.csv")

