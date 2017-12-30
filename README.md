# Getting-and-Cleaning-Data

This is the course project for the Getting and Cleaning Data Coursera course.The R script, run_analysis.R, does the following:


1.) Download the dataset  if it does not already exist in the working directory

2.) Read all the following files into memory.

    2.a) X_test.txt

    2.b) Y_test.txt
  
    2.c) subject_test.txt
    2.d) X_train.txt
 
    2.e) Y_train.txt
  
    2.f) activity_labels.txt
   
    2.g) features.txt
  
    2.f) subject_train.txt
 
3.) Add Activity_labels & Subject information to the Test Dataset.Convert Activity_labels from numbers to actual activity name.

4.) Add Activity_labels & Subject information to the Train Dataset.Convert Activity_label from numbers to actual activity name.

5.) Merge Test and Train datasets

6.) Filter all columns names measuring Mean and Standard Deviations.

7.) Creates a  tidy dataset containing summarized information for all subjects and all activities.

8.) The end result is shown in the file tidy.txt
