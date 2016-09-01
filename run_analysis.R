# CleaningData Week4 Assignment
#0. Clear all and get to the coalmine
#{
        rm(list = ls())
        setwd("/Users/Lars2016/MyR/data")
        setwd("CleaningWeek4/UCI HAR Dataset")
#}

#1.0 Load labels
#{
        ActivityName<-read.table("activity_labels.txt")
        library(dplyr)
        FeatureName_raw<- read.table("features.txt") %>% 
                            select(V2) %>% t #transpose
        FeatureName<-make.names(names=FeatureName_raw,unique=TRUE, allow_ = TRUE) #clean labels with only valid chars
        rm(FeatureName_raw)
#}
                    
#1.1 Load testsets
#{
        setwd("test")
        SubjectTest <- read.table("subject_test.txt")
        Xtest <- read.table("X_test.txt")
        ytest <- read.table("y_test.txt")
#}

#1.2 Load trainsets
#{
        setwd("../train")
        SubjectTrain <- read.table("subject_train.txt")
        Xtrain <- read.table("X_train.txt")
        ytrain <- read.table("y_train.txt")
#}

#1.3 merge all train and test sets and give meaningful setnames
#{
        SubjectFeature<-rbind(SubjectTest,SubjectTrain) #Linktable SubjectID,Row=FeatureID
        Feature_all<-rbind(Xtest,Xtrain) #FeatureID with all measurements
        ActivityFeature<-rbind(ytest,ytrain) #Linktable ActivityID,Row=FeatureID
        rm(SubjectTest)
        rm(SubjectTrain)
        rm(Xtest)
        rm(Xtrain)
        rm(ytest)
        rm(ytrain)
#}

#1.4 Making all the sets tidy:
#{
        #Subject_Feature:give meaningful colname
        names(SubjectFeature)<-c("SubjectID")
        #Feature: give meaningful colnames and make subset of only the stds and means:
        names(Feature_all)<-FeatureName
        Feature <- Feature_all %>% select(contains("std"),contains("mean"))
        rm(FeatureName)
        rm(Feature_all)
        #Activity (ActivityName,Activity_Feature): rename ID to name
        names(ActivityName)<-c("ActivityID","ActivityName")
        names(ActivityFeature)<-c("ActivityID")
        ActivityFeature<- ActivityFeature %>% left_join(ActivityName, "ActivityID") %>% select(ActivityName)
        rm(ActivityName)
#}

#1.5 Combining the tidy sets into one
# SubjectID num
# ActivityName char
# Only the subset of 561 features containing mean or std (unique)
#{
        SubjectActivityFeature<- SubjectFeature %>% cbind(ActivityFeature) %>% cbind(Feature)
        rm(SubjectFeature)
        rm(ActivityFeature)
        rm(Feature)
#}

        
#2.0 From SubjectActivityFeature create a second, independent tidy data set with the average of each variable for each activity and each subject.
#{
        SubjectActivityFeature_avg <- SubjectActivityFeature %>% group_by(SubjectID,ActivityName) %>% summarize_each(funs(mean))
        write.table(SubjectActivityFeature_avg,"SubjectActivityFeature_avg.txt",row.names = FALSE)
        
#}