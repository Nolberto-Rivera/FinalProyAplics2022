library(MASS)
library(e1071)
library(caTools)
library(class)

filename = "D:/GithubRepos/FinalProyAplics2022/Dry_Bean_Dataset.csv"
porotos <- read.csv(filename, header = TRUE, sep = ";")

covars = ncol(porotos) 

split = sample.split(porotos, SplitRatio = 0.7)
train_cl = subset(porotos, split == "TRUE")
test_cl = subset(porotos, split == "FALSE")

classifier_knn <- knn(train = train_cl[,-covars],
                      test = test_cl[,-covars],
                      cl = train_cl$Class,
                      k = 1)
cm <- table(test_cl$Class, classifier_knn)
cm