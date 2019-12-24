## Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

### Explanation of each file

* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Names and IDs for each of the 6 activities.

* `X_train.txt`: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* `subject_train.txt`: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in `X_train.txt`.
* `y_train.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.

* `X_test.txt`: 2947 observations of the 561 features, for 9 of the 30 volunteers.
* `subject_test.txt`: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in `X_test.txt`.
* `y_test.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.

### Processing steps

1. #Get all input Files
2. #Merge Activity Data Set with additional description
3. #Merge Values Data Set And Get only mean and std columns
4. #Format the columns names from values Data Set
5. #Merge All the Data Set.
6. #Generate a Data Set Grouped by Subject and Activity and generate a AVG from al variables.
7. #Write the output in a File.
