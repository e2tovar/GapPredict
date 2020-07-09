validateData <- function(target, predictors_list, country, year){
  #validar los nombres de los csv y el formato.
 
  
  #nombres
  my_data = list.files(path = 'data/', recursive = TRUE)
  data = c(target, predictors_list)
  both <- data %in% my_data
  
  
  check <- all(both)
  
  if(!check){
    
    
    logerror(paste0("Bad names: ", paste(unlist(data[!both]), collapse=','),
             logger = 'log'))
    
    stop()
  

    
  }
  
}
  