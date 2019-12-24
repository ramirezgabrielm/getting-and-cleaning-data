#Initial package

install.packages("dplyr")
install.packages("qdap")

#Initial Library
library(dplyr)
library(qdap)


#Get all input Files

ds_test_subject <- read.csv("subject_test.txt", header=FALSE, col.name="Subject")
ds_test_values <- read.csv("X_test.txt", header=FALSE, sep = "")
ds_test_activity <- read.csv("y_test.txt",header=FALSE)

ds_train_subject <- read.csv("subject_train.txt", header=FALSE,col.name="Subject")
ds_train_values <- read.csv("X_train.txt", header=FALSE, sep = "")
ds_train_activity <- read.csv("y_train.txt",header=FALSE)

activity_labels <- read.csv("activity_labels.txt",header=FALSE, sep=" ",col.names = c("id","Activity"))
features <- read.csv("features.txt",header=FALSE, sep=" ", col.name= c("id","desc"))


#Merge Activity Data Set with additional description
ds_activity <- rbind(ds_test_activity,ds_train_activity)
names(ds_activity) <- c("id")
ds_activity_desc <- select(join(ds_activity, activity_labels, by = "id"), -id)


#Merge Values Data Set And Get only mean and std columns
ds_values <- rbind(ds_test_values,ds_train_values)
names(ds_values) <- features$desc
ds_values_selected <- ds_values[,grepl("(mean\\(\\))|std\\(\\)",names(ds_values))]


#Format the columns names from values Data Set

l_name_patterns <- c("^t{1}","^f{1}","BodyBody","Body","Acc", "Gravity","Gyro", "Mag", "Jerk")
l_repl_patterns <- c("Time ", "Frequency ","Body","Body ","Accelerator ", "Gravity ", "Gyroscope ","Magnitude ", "Jerk ")
	
names(ds_values_selected) <- mgsub(l_name_patterns, l_repl_patterns, names(ds_values_selected), fixed=FALSE)

#Merge All the Data Set.

ds_subject <- rbind(ds_test_subject, ds_train_subject)
ds_all <- cbind(ds_subject,ds_activity_desc,ds_values_selected)

#Generate a Data Set Grouped by Subject and Activity and generate a AVG from al variables.
ds_group <- group_by(ds_all,Subject, Activity)
ds_group_mean <- summarise_all(ds_group, .funs = c(mean="mean"))

#Write the output in a File.
write.table(ds_group_mean, file = "tidy_gr_dataset.csv", row.names=FALSE)