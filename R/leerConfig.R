#' @title leer_config
#'
#' @param path 
#'
#' @return config
#' 
#' @import XML
#' @import logging
#'
#' @examples

leer_config <- function(path){
  
  library(XML)
  
  #get config path
  path_config <- paste0(path, "config/", "config.xml")
  
  
  tryCatch(expr = {
    #Read ad convert to list
    config_xml <- xmlParse(file = path_config)
    config <- xmlToList(config_xml)
    
  }, error = function(e){
    
    logerror("There is no config. Verify the name 'config.xml'",
             logger = 'log')
    stop()
  })
  
  validateConfig(config)
  loginfo("Config read.", logger = 'log')
  
  return(config)
  
} 