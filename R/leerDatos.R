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
  #esto me devolvera un string con el nombre del csv del target
  target_csv <- config$input$target
  
  #esto me devolvera una lista con los nombres de los csv de los predictores
  string_predictores_csv <- config$input$feature
  lista_predictores_csv <- as.list(unlist(strsplit(string_predictores_csv, ',')))
  
  #cargar pais y nombre. TODO
  country <- config$input$country
  year <- config$input$year
  target <- c(country, year)

  #loading csv(s) in df(s)
  lista_df_pred <- list()
  for (x in lista_predictores_csv){
    df_name  <- substring(x, 1, nchar(x)-4)
    
    lista_df_pred[[df_name]] <- read.csv(paste0(path, 'data/', x))
  }
  lista_final <- c()
 
  return(lista_df_pred)
}
