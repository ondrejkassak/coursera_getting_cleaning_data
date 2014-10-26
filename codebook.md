HELPER VARAIBLES
path_to_data - path to dataset, helper variable
boolean_column_names - boolean vector containing true only for mean, standard deviation and ids from column_names variable

VARIABLES WITH SOURCE DATA
activity_labels - labels describing possible activity types
features - features (columns) describing variables in x_{train, test} dataset
x_test - dataset of test features of individual logs (their names describe file features.txt)
y_test - dataset of test feature containing activity type for individual logs
subject_test - dataset of test feature containing id of subject for individual logs

x_train - dataset of train features of individual logs (their names describe file features.txt)
y_train - dataset of train feature containing activity type for individual logs
subject_train - dataset of train feature containing id of subject for individual logs

column_names - vector of final_dataset column names

VARIABLES WITH JOINED SOURCE DATA
test_data - bind dataset of test variables
train_data - bind dataset of train variables
final_data - bind dataset of test and train variables, later in addition joined with activity labels

VARIABLES WITH CLEANED DATA
final_data contains after application of boolean_column_names only subset of satisfying columns (means, standard deviations and ids.)

OUTPUT DATA
tidy_data - table containing for every unique pair of activity and subject, the means of variables from individual columns
