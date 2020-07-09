#' @title leerDatos
#'
#' @param config 
#' @param path 
#'
#' @return
#' 
#' @import data.table
#' @import logging
#'

leer_datos <- function(config, path){
  
  #Cargar datos
  target_csv <- config$input$target
  string_predictores_csv <- config$input$feature
  country <- config$input$country
  year <- config$input$year
  #target <- c(country, year)
  
  #esto me devolvera una lista con los nombres de los csv de los predictores
  lista_predictores_csv <- as.list(strsplit(string_predictores_csv, ",")[[1]])
  
  #Validar Datos
  validateData(target = target_csv, predictors_list = lista_predictores_csv,
               country = country,
               year = year
               )
  

  #loading csv(s) in df(s)
  lista_df_pred <- list()
  for (x in lista_predictores_csv){
    df_name  <- substring(x, 1, nchar(x)-4)
    
    lista_df_pred[[df_name]] <- read.csv(paste0(path, 'data/', x), check.names = FALSE)
    #lista_df_pred[[df_name]] <- data.table::fread(paste0(path, 'data/', x), sep = config$input$sep,
                                       #encoding = 'UTF-8', data.table = FALSE)
  }
  
  #crear nombre target
  target_name = paste0(substring(target_csv, 1, nchar(x)-4), "_target")
  lista_df_target <- list()
  lista_df_target[[target_name]] <-  read.csv(paste0(path, 'data/', target_csv), check.names = FALSE)
  
  lista_final <- c(lista_df_target, lista_df_pred)
 
  return(lista_final)
}