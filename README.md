---
title: "README"
author: "Ashvath Singh Kunadi"
date: "Sunday, January 31, 2016"
output: html_document
---
#Script for Analysis

##Introduction

Before I begin to describe the R Script that I have written I would like to bring to your attention that there are two R scripts. One is the required run_analysis.R and the other is a script that I wrote to make the data a tad bit tidier than it was in required in the assignment. If you can, please go through that script as well and let me know what you think about it. 

So the assignment prescribed 5 steps to tidy the data set given to us. Here are the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Step 1
To begin with we need to read all of the files that are required to generate the untidy data set. For this we need to read in all the data that is present in the **test** and **train** data. The following code does that for us:

```{r}
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"")
View(subject_test)
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"")
View(X_test)
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"")
View(y_test)
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"")
View(subject_train)
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"")
View(X_train)
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"")
View(y_train)
```

Once the data has been read in then it is required that we merge the two data sets of **test** and **train**. The following R code does that:

```{r}
subject <- rbind(subject_test, subject_train)
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
```

Now that we have the two datasets merged step 1 is complete.

##Step 2 and Step 4
Now the X file contains the features recorded and their values. However, the names of these features need to be extracted from the features file.

```{r}
features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"")
View(features)
```

The second column of this data set contains the name of the columns names of the `r X` data set. Now we need to code so that the names are given to the appropriate columns.

```{r}
colnames(X) <- features$V2
```

Finally we need to extract only the data that contain the mean and standard deviation data. This is done by the following code.

```{r}
remove <- grep("meanFreq", names(com))
length(grep("std", names(com)))
subsettablelist <- c(grep("std", names(com)), grep("mean", names(com)))
subsettablelist <- subsettablelist [!subsettablelist %in% remove]
```

Here `r com` signifies the combined data of the **subject**, **activity** and **features**. Here `r meanFreq` needs to be removed as it is not a mean or standard deviation. 

##Step 3
The next block of code has to assign the numbers given in the activities descriptive names.

```{r}
class(y$activity)
y$activity <- as.integer(y$activity)
class(y$activity)
y$activity <- gsub(5, "standing", y$activity)
y$activity <- gsub(1, "walking", y$activity)
y$activity <- gsub(2, "walking_upsatirs", y$activity)
y$activity <- gsub(3, "walking_downstairs", y$activity)
y$activity <- gsub(4, "sitting", y$activity)
y$activity <- gsub(6, "laying", y$activity)
View(y)
y$activity <- as.factor(y$activity)
```
This was fairly strightforward as we assigned the names by first converting the `r y$activity` into integers and then we convert the integers to characters with the description given in the folder. 

*Note:* The two scripts are similar till this point but start differing after this point. The assignment requirement is given in **Step 5**. The additional tidying of the data is given under **Optional**.

##Step 5

One step I omitted was to combine all of these datasets. This was done fairly simply by the following code.

```{r}
com <- merge(y, subject)
View(com)
com <- merge(com, X)
View(com)
```

The mergeing was done after all of the columns were descriptively labelled. The merging of the dataset needs to have a common id which was created by having `r id <- 1:10299`. This id was column bounded to all of the combined data sets.

Once this was done we got the following code block to make a new dataset from the already combined dataset. 

```{r}
yo <- lapply(split(reqcom[[5]], list(f1,f2)), mean)
naam <- names(yo)
yo2 <- data.frame(naam)
for(x in 4:69){
        yo <- lapply(split(reqcom[[x]], list(f1,f2)), mean)
        for(y in 1:180){
                yo2[y, (x-2)] <- as.numeric(yo[y])
        }
}
colnaam <- c("observation", as.character(names(reqcom[4:69])))
colnaam
names(yo2) <- colnaam
View(yo2)
yo1 <- yo2[2:67]
yo3 <- cbind(Actions = rep(c("Laying", "Sitting", "Standing", "Walking", "Walking_downstairs", "Walking_downstairs"), times = 30), Subject = rep(1:30, each = 6), yo1)
View(yo3)
```
This block of code first contains making a column of the required dataset just as a check and to initialize the data frame that will contain the means of the data for the for every activity and every subject. 

The for loop and the nested one both are to create the required data frame. After which the majority of the work done is of labelling. 

##Optional
The *tidierdata.md* contains a code which breaks down the data presented in the X data set into the following parts.
*Domain
*Calculation
*Data type
*Axis
*Parameter

The remaining columns containg the data are just the following.
*Body
*BodyJerk
*BodyBodyJerk

I will now explain what the different seperations were.

###Domain
The domain was the frequency or time domain which was given with the prefix before the variable name.

###Calculation
The calculation gave us whether the standard deviation or the mean was calculated of the data set required. 

###Data type
This was done to seperate the **magnitude** and **axial** data. This category was made as the column names consisted of these suffixes.

###Axis
This was only for axial data. This was done to seperate out **X**, **Y** and **Z** axis.

###Parameter
This tells us whether the value given was for acceleration or angular velocity which was given by the suffix **acc** and **gyro**.

The code that was repeatedly used in one form or the other to make these comparisons was in this format.

```{r}
meanwale <- tidy1[, grep("mean", names(tidy1))]
index1 <- tidy1[, c(1, 2, 3, 42)]
View(tidy1)
View(index1)
names(stdwale) -> stdnames
stdnames <- gsub("-std", "", stdnames)
stdnames
names(meanwale) -> meannames
meannames <- gsub("-mean", "", meannames)
meannames
duplicated(c(meannames,stdnames))
names(meanwale) <- meannames
names(stdwale) <- stdnames
stdwale1 <- cbind(calculation = "StandardDeviation", stdwale)
View(stdwale1)
meanwale1 <- cbind(calculation = "Mean", meanwale)
View(meanwale1)
index2<- rbind(index1, index1)
tidy2<- rbind(meanwale1, stdwale1)
tidy2<- cbind(index2, stdwale1)
View(tidy2)
```

The code checks whether the lengths and names of the variables after removing the parameter is the same or not. If not a blank column of NA's is added to the dataframe with the required column names. Once this is done wemerge the dataset with the exisiting index that we created which continues to grow with each parameter added.

Please go through the code described above and let me know what you think about seperating the data based on these parameters.
