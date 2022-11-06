
# P R E P A R A T I O N
#install.packages("openxlsx")
library("openxlsx")

# access route with / (not \) and without initial 'C:'
dbd <- read.xlsx("/Users/nolbe/Desktop/2022-2/MAT281 - Aplics de la Mat en Ing (Adelantado)/4 Evaluaciones/Proyecto/DryBeanDataset/Dry_Bean_Dataset.xlsx", sheet = "Dry_Beans_Dataset")

#dbd
#names(dbd)
attach(dbd)

# P R E S E N T A T I O N
#install.packages("tidyverse")
library(dplyr)
dbd %>% 
group_by(Class) %>% 
summarise(frequency = n())
