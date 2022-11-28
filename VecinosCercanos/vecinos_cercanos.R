library(MASS)
library(e1071)
library(caTools)
library(class)

vecinos_cercanos <- function(traing, testg, k) {
	covars = ncol(traing)
	classifier_knn <- knn(train = traing[,-covars],
                      test = testg[,-covars],
                      cl = traing$Class,
                      k = k)
	cm <- table(testg$Class, classifier_knn)
	return(cm)

}