leer_config() <- function(path){
  #get config
  path_config = paste0(path, "config/", "config.xml")
  config_xml <- xmlParse(file = path)
  config <- xmlToList(config_xml)
  return(config)
}


