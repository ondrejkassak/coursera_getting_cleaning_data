# 1. Merge the training and the test sets to create one data set.

#path to dataset
path_to_data = "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/";

#read data from files - (paste function is used to simplification of path from which is read)
#labels and features
activity_labels = read.table(paste(path_to_data, "activity_labels.txt", sep=""),header=FALSE);
features = read.table(paste(path_to_data, "features.txt", sep=""),header=FALSE);
#set column names for activity_lables table
colnames(activity_labels) = c('activity_id', 'activity_labels');

#read test data
x_test = read.table(paste(path_to_data, "test/X_test.txt", sep=""),header=FALSE);
y_test = read.table(paste(path_to_data, "test/y_test.txt", sep=""),header=FALSE);
subject_test = read.table(paste(path_to_data, "test/subject_test.txt", sep=""),header=FALSE);
#set column names for above variables
colnames(x_test) = features[,2]; 
colnames(y_test) = "activity_id";
colnames(subject_test) = "subject_id";
#bind test data into one variable
test_data = cbind(x_test, y_test, subject_test);

#read train data
x_train = read.table(paste(path_to_data, "train/X_train.txt", sep=""),header=FALSE);
y_train = read.table(paste(path_to_data, "train/y_train.txt", sep=""),header=FALSE);
subject_train = read.table(paste(path_to_data, "train/subject_train.txt", sep=""),header=FALSE);
#set column names for above variables
colnames(x_train) = features[,2]; 
colnames(y_train) = "activity_id";
colnames(subject_train) = "subject_id";
#bind train data into one variable
train_data = cbind(x_train, y_train, subject_train);

#bind train and test data under each other
final_data = rbind(train_data, test_data);
#-------------------------------------------------------------------------------------

# 4. Appropriately label the data set with descriptive activity names.
#create vector with column names
column_names  = colnames(final_data);
#-------------------------------------------------------------------------------------

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
#create boolean vector containing true only for mean, standard deviation and ids
boolean_column_names = (grepl("-mean..",column_names) | grepl("-std..",column_names) | grepl("activity..",column_names) | grepl("subject..",column_names) );

#get subset from final_data containgg above selected columns 
final_data = final_data[boolean_column_names==TRUE];

#-------------------------------------------------------------------------------------
# 3. Use descriptive activity names to name the activities in the data set.
# merge final data with text actiivty names by activity_labels attribute 
final_data = merge(final_data,activity_labels,by='activity_id',all.x=TRUE);

#-------------------------------------------------------------------------------------
#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#delete activity_labels column bwfore mean
final_data = final_data[,names(final_data) != 'activity_labels'];
#create tidy table containing for every unique pair of activity and subject, the means of individual variables
tidy_data = aggregate(final_data[,names(final_data) != c('activity_id','subject_id')],by=list(activity_id = final_data$activity_id,subject_id = final_data$subject_id),mean);
#merge tidy_data to include descriptive activity names
tidy_data = merge(tidy_data,activity_labels,by='activity_id',all.x=TRUE);

#export the tidy_data into text file
write.table(tidy_data, './tidy.txt',row.names=FALSE,sep='\t');