features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"")
View(features)
colnames <- features$V2
colnames <- as.character(colnames)
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
subject <- rbind(subject_test, subject_train)
features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"")
View(features)
subject <- rbind(subject_test, subject_train)
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
View(X)
colnames(X) <- features$V2
View(X)
id <- 1:10299
subject <- cbind(id=id, subject)
X <- cbind(id=id, X)
y <- cbind(id=id, y)
colnames(subject) <- c("id", "subject")
colnames(y) <- c("id", "activity")
View(y)
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
com <- merge(y, subject)
View(com)
com <- merge(com, X)
View(com)
com$subject <- as.factor(com$subject)
colnames(com)
splitNames = strsplit(names(com), "-")
colnames(com)
class(splitNames)
splitNames <- as.array(splitNames)
head(splitNames)
remove <- grep("meanFreq", names(com))
length(grep("std", names(com)))
reqcom <- com[, subsettablelist]
subsettablelist <- subsettablelist [!c(1, 2, 3)]
subsettablelist <- c(grep("std", names(com)), grep("mean", names(com)))
subsettablelist <- subsettablelist [!subsettablelist %in% remove]
subsettablelist <- c(1, 2, 3, subsettablelist)
sort(subsettablelist)
reqcom <- com[, subsettablelist]
View(reqcom)
timewale <- grep("^t", names(reqcom))
timewale <- reqcom[, timewale]
timewale <- timewale[,order(names(timewale))]
freqwale <- grep("^f", names(reqcom))
freqwale <- reqcom[, freqwale]
freqwale <- freqwale[,order(names(freqwale))]
index <- reqcom[, 1:3]
View(index)
View(timewale)
View(freqwale)
colnames(timewale) <- sub("t", "", names(timewale))
colnames(freqwale) <- sub("f", "", names(freqwale))
names(freqwale)
names(timewale)
timewale <- cbind(domain = rep("time"), timewale)
freqwale <- cbind(domain = rep("frequency"), freqwale)
timewale1 <- cbind(index, timewale)
freqwale1 <- cbind(index, freqwale)
names(freqwale1)
names(timewale1)
names(freqwale1) <- gsub("\\(\\)", "", names(freqwale1))
names(timewale1) <- gsub("\\(\\)", "", names(timewale1))
names(timewale) <- gsub("\\(\\)", "", names(timewale))
names(freqwale) <- gsub("\\(\\)", "", names(freqwale))
allnamestfirst <- c(names(timewale), names(freqwale))
allnamesffirst <- c(names(freqwale), names(timewale))
addtot <- unique(allnamestfirst)
addtot <- addtot[42:47]
freqwale1 <- cbind(freqwale, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA)
colnames(freqwale1) <- unique(allnamesffirst)
timewale1 <- cbind(timewale, a = NA, a = NA, a = NA, a = NA, a = NA, a = NA)
colnames(timewale1) <- unique(allnamestfirst)
timewale1 <- timewale1[,order(names(timewale1))]
freqwale1 <- freqwale1[,order(names(freqwale1))]
tidy1 <- rbind(freqwale1, timewale1)
index1 <- rbind(index, index)
tidy1 <- cbind(index1, tidy1)
tail(tidy1)
head(tidy1)
grep("mean", names(tidy1))
length(grep("mean", names(tidy1)))
length(grep("std", names(tidy1)))
stdwale <- tidy1[, grep("std", names(tidy1))]
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
grep("Mag", names(tidy2))
length(grep("Mag", names(tidy2)))
length(grep("X", names(tidy2)))
length(grep("Y", names(tidy2)))
length(grep("Z", names(tidy2)))
index2 <- tidy2[, 1:5]
View(index2)
Xwale <- tidy2[, grep("X", names(tidy2))]
Ywale <- tidy2[, grep("Y", names(tidy2))]
Zwale <- tidy2[, grep("Z", names(tidy2))]
Magwale <- tidy2[, grep("Mag", names(tidy2))]
Xnames <- names(Xwale)
Xnames <- gsub("-X", "", Xnames)
Ynames <- names(Ywale)
Znames <- names(Zwale)
Ynames <- gsub("-Y", "", Ynames)
Znames <- gsub("-Z", "", Znames)
names(Ywale) <- Ynames
names(Zwale) <- Znames
names(Xwale) <-  Xnames
Xwale1 <- cbind(Datatype = "axial", axis = "X", Xwale)
View(Xwale1)
Ywale1 <- cbind(Datatype = "axial", axis = "Y", Ywale)
Zwale1 <- cbind(Datatype = "axial", axis = "Z", Zwale)
View(Ywale1)
View(Zwale1)
index3 <- rbind(index2, index2, index2, index2)
axial <- rbind(Xwale1, Ywale1, Zwale1)
names(Magwale) <- gsub("Mag", "", names(Magwale))
names(Magwale)
axial1 <- cbind(axial, BodyBodyAccJerk = NA, BodyBodyGyroJerk = NA, BodyBodyGyro = NA)
names(axial1)
Magwale1 <- cbind(Datatype = "magnitude", axis = NA, Magwale)
names(Magwale1)
Magwale1 <- Magwale1[, c(1,2,4,3,9,8,10,5,6,7)]
names(Magwale1)
names(axial1)
tidy3 <- rbind(axial1, Magwale1)
tidy3 <- cbind(index3, tidy3)
View(tidy3)
index4 <- tidy3[, 1:7]
View(index4)
grep("Acc", names(tidy3))
grep("Gyro", names(tidy3))
acc <- tidy3[, grep("Acc", names(tidy3))]
View(acc)
gyro <- tidy3[, grep("Gyro", names(tidy3))]
View(gyro)
names(acc) <- gsub("Acc", "", names(acc))
View(acc)
acc1 <- cbind(parameter = "Acceleration", acc)
View(acc1)
names(gyro) <- gsub("Gyro", "", names(gyro))
gyro1 <- cbind(parameter = "AngularVelocity", gyro)
View(gyro1)
acc1 <- acc1[, c(1,2,3,5,4)]
acc1 <- cbind(acc, BodyBody = NA)
View(acc1)
acc1 <- cbind(parameter = "Acceleration", acc)
acc1 <- acc1[, c(1,2,3,5,4)]
acc1 <- cbind(acc1, BodyBody = NA)
View(acc1)
gyro1 <- cbind(gyro1, Gravity = NA)
acc1 <- acc1[, c(1,2,3,4,6,5)]
View(gyro1)
View(acc1)
index4 <- rbind(index4, index4)
tidy4 <- rbind(acc1, gyro1)
tidy4 <- cbind(index4, tidy4)
tidy5 <- tidy4[, 2:11]
View(tidy5)
write.csv(tidy5, "~/TidyData5.csv")
rm(Magwale, Magwale1, X, X_test, X_train, y, y_test, y_train, Xwale, Xwale1, Ywale, Ywale1, Zwale, Zwale1, acc, acc1, axial, axial1, com, features, freqwale, freqwale1, gyro, gyro1, index, index1, index2, index3, index4, meanwale, meanwale1, reqcom, stdwale, stdwale1, subject, subject_test, tidy1, tidy2, tidy3, tidy4, timewale, timewale1, subject_train)
