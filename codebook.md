
Data Source:

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Following files have been extracted from the above location.Given below is a brief description of these datasets.

a.) X_test.txt   : Test set containing 561-feature vector

b.) Y_test.txt   : Test labels 

c.) subject_test.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

d.) X_train.txt  :  Training set containing 561-feature vector

e.) Y_train.txt  :  Training Labels

f.) activity_labels.txt : Links the class labels with their activity name.

g.) features.txt  : List of all features.

f.) subject_train.txt  : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
 

Transformation applied to Data:

1.) Added Activity_labels & Subject information to the Test & Train Datasets.

2.) Converted Activity_labels from numbers to actual activity name.For eg. Activity_name -> 1 converted to "Walking".

3.) After applying above transformations, Training & Test datasets were merged.

4.) Columns containing Measured Mean and Standard Deviations were selected.

5.) Finally,a  tidy dataset created with summarized information for all subjects and all activities.

6.) The end result is shown in the file tidy.txt





