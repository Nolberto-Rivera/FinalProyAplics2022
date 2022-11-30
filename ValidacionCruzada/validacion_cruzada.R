library(dplyr)
library(class)

validacion_cruzada <- function(dataframe, N, get_cm, param) {
	grupos=split(porotos, sample(1:N, nrow(porotos), replace=T))
	cmcreated = F
	for(i in 1:N){
		traing = bind_rows(grupos[-i])
		testg = bind_rows(grupos[i])
		if(cmcreated==F){
			cmcreated=T
			cm = get_cm(traing,testg, param)
		}
		else {
			cm = cm+get_cm(traing,testg, param)

		}
	}
	return(cm)
}

get_subcm <- function(cm, clase){
	VP = cm[clase,clase]
	P = 0
	for(i in cm[,clase]){
		P = P + i
	}
	FP = P-VP
	total = 0

	for(i in cm){
		total = total+i
	}
	N = total-P
	FN = 0
	for(i in cm[clase,]){
		FN = FN+ i
	}
	FN = FN-VP
	VN = N-FN
	
	result = matrix(c(VP,FN,FP,VN),nrow = 2, byrow = TRUE, dimnames = list(c("P","N"),c("PP","PN")))
	return(result)
}

get_error<- function(cm){
	total = 0
	for(x in cm){ total = total+x }
	aciertos = 0
	for(i in 1:nrow(cm)){ aciertos = aciertos+cm[i,i] }
	return((total-aciertos)/total)
}