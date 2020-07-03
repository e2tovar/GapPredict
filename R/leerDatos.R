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


leerDatos <- function(config, path_data){
  
  #esto me devolvera un string con el nombre del csv del target
  target_csv <- config$input$target
  
  #esto me devolvera una lista con los nombres de los csv de los predictores
  lista_csv <- config$input$feature
  
  #cargar csv del taget en dataframe
 
  return(target_csv)
}

target_csv = leerDatos(config, path_data)
