# Tidy data analysis script

# Read test data

test<-read.table("C:/KRaj/DataScience/data/UCIHAR~1/test/X_test.txt", sep="\t")
colnames(test) <- c("data")

# Read column data
features<-read.table("C:/KRaj/DataScience/data/UCIHAR~1/features.txt", sep="\t")
features1<-separate(features,V1,into=c("num", "heading"),sep=" ")
features2<-features1[,2]
test1<-separate(test,data,into=features2,sep=" ")

# Read train data
train<-read.table("C:/KRaj/DataScience/data/UCIHAR~1/train/X_train.txt", sep="\t")
colnames(train) <- c("data")
train1<-separate(train,data,into=features2,sep=" ")
final_data <- rbind(test1, train1)

# Filter mean and std columns

tmp<-grepl("mean..$", features2) | grepl("std..$", features2)
tmp1<-features2[tmp]
tidy_data <- final_data[tmp1]

# Write to file
write.table(tidy_data, "C:/KRaj/DataScience/data/UCIHAR~1/tidy_data.txt", row.names = FALSE)

