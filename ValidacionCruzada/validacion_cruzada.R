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