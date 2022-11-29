library(class)

filename = "D:/GithubRepos/FinalProyAplics2022/Dry_Bean_Dataset.csv"
porotos <- read.csv(filename, header = TRUE, sep = ";")

validacion_cruzada(porotos, 10, vecinos_cercanos, 3)