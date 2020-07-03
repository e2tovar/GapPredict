#Loading require libraries
lapply(c('XML', 'logging'), require, character.only = TRUE)

directorio <- "D:/Estudio/BootCamp/R_Course/GapPredict/"

#set directory
setwd(directorio)

#getting scripts from R file
archivos = list.files(path = 'R/', recursive = TRUE)

#Applying all functions 
lapply(paste0("R/", archivos), source)


debug(gapPredictApp)
gapPredictApp(directorio)
undebug(gapPredictApp)

