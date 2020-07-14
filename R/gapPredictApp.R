#' @title gaporedictApp
#' @description Main function of the app
#' 
#' @param path, string 
#' 
#' @export
#' @import logging
#'
#' @author Eddy, Mai, Borja, Ines

gapPredictApp <- function(path){
  
  tryCatch(expr = {
    
    library(logging)
    
    #Generating log handler
    addHandler(writeToFile, logger = 'log', file = paste0(path, "log/logfile.log"))
    loginfo("Starting...", logger = 'log')
    
    loginfo("Reading Config...", logger = 'log')
    config <- leer_config(path)
    loginfo("Config File read.", logger = 'log')
    
    loginfo("Reading Data...", logger = 'log')
    datos <- leer_datos(config, path)
    loginfo("Datos leidos.", logger = 'log')
    
    
    loginfo("Procesing Data...", logger = 'log')
    df_merged <- combine_data(datos)
    loginfo("Procesing done.", logger = 'log')
    
    loginfo("Cleaning Data...", logger = 'log')
    final_df <- clean_data(df_merged, config)
    loginfo("Data ready to model", logger = 'log')
    
    browser()
     # loginfo("Generando modelo...", logger = 'log')
     # output <- generarModelo(splitDatos, config)
     # loginfo("Modelo Generado.", logger = 'log')
    # 
    # 
    # loginfo("Generando output...", logger = 'log')
    # generarOutput(output, config, path)
    # loginfo("Output generado.", logger = 'log')
    
  }, error = function(e){
    
    logerror("App has Fail...", logger = 'log')
    stop()
    
  },finally = {
    
    loginfo("Completed", logger = 'log')
    removeHandler(writeToFile, logger = 'log')
    
  })
  
}
