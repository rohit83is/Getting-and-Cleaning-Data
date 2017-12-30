run_analysis <- function() {
  library("dplyr")
  
  ## Download and unzip the dataset:
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dest="dataset.zip", mode="wb")
  
  
  if (!file.exists("UCI HAR Dataset")) { 
    unzip ("dataset.zip")
  }
  
  #Read all the files into memory
  
  x_test <- read.table("~/R/UCI HAR Dataset/test/X_test.txt") 
  y_test <- read.table("~/R/UCI HAR Dataset/test/Y_test.txt")
  subject_test <- read.table("~/R/UCI HAR Dataset/test/subject_test.txt")
  x_train <- read.table("~/R/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("~/R/UCI HAR Dataset/train/Y_train.txt")
  activity_labels <- read.table("~/R/UCI HAR Dataset/activity_labels.txt")
  features <- read.table("~/R/UCI HAR Dataset/features.txt")
  subject_train <- read.table("~/R/UCI HAR Dataset/train/subject_train.txt")
  
  
  #Add Activity & Subject information to the Test Dataset.Convert Activity columns from numbers to actual activity name.
  
  colnames(x_test) <- features$V2
  temp_test <- cbind(y_test,x_test)
  colnames(temp_test)[1] <- "activity_name"
  temp_test <- cbind(subject_test,temp_test)
  colnames(temp_test)[1] <- "subject_test"
  
  temp_test$`activity_name`[temp_test$`activity_name` == 1] <- "WALKING"
  temp_test$`activity_name`[temp_test$`activity_name` == 2] <- "WALKING_UPSTAIRS"
  temp_test$`activity_name`[temp_test$`activity_name` == 3] <- "WALKING_DOWNSTAIRS"
  temp_test$`activity_name`[temp_test$`activity_name` == 4] <- "SITTING"
  temp_test$`activity_name`[temp_test$`activity_name` == 5] <- "STANDING"
  temp_test$`activity_name`[temp_test$`activity_name` == 6] <- "LAYING"
  
  
  #Add Activity & Subject information to the Train Dataset.Convert Activity columns from numbers to actual activity name.
  
  colnames(x_train) <- features$V2
  temp_train <- cbind(y_train,x_train)
  colnames(temp_train)[1] <- "activity_name"
  temp_train <- cbind(subject_train,temp_train)
  colnames(temp_train)[1] <- "subject_test"
  
  temp_train$`activity_name`[temp_train$`activity_name` == 1] <- "WALKING"
  temp_train$`activity_name`[temp_train$`activity_name` == 2] <- "WALKING_UPSTAIRS"
  temp_train$`activity_name`[temp_train$`activity_name` == 3] <- "WALKING_DOWNSTAIRS"
  temp_train$`activity_name`[temp_train$`activity_name` == 4] <- "SITTING"
  temp_train$`activity_name`[temp_train$`activity_name` == 5] <- "STANDING"
  temp_train$`activity_name`[temp_train$`activity_name` == 6] <- "LAYING"
  
  
  #Merge Test and Train datasets
  
  final <- rbind(temp_test,temp_train)
  # Select rows which measure Mean and STD
  pattern <-  grep("[Mm]ean|std", names(final),value = TRUE)
  final_2 <- subset(final, select = c("subject_test","activity_name",pattern))
  
  # Summarize the final dataset
  
  aggr <- group_by(final_2,subject_test,activity_name)
  sum <- summarize_all(aggr,funs(mean))
  write.table(sum,"tidy.txt",row.names = FALSE)
  
}
