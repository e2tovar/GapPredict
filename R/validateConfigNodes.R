#' @title validateConfigNodes
#'
#' @param config 
#'
#' @import logging
#' 

validateConfig <- function(config){
  browser()
  #check names in Main and input nodes
  nodoPrincipal <- identical(names(config), c("input"))
  nodoInput <- identical(names(config$input), c("feature", "target", "country",
                                                "year", "sep"))
  
  #check whether there are empty feture, target, country and year
  nodoFeature <- nchar(config$input$feature) > 0
  nodoTarget <- nchar(config$input$target) > 0
  nodoCountry <- nchar(config$input$country) > 0
  nodoYear <- nchar(config$input$year) > 0
  
  #Check and cast year as numeric
  tryCatch(expr = {
    config$input$year <- as.numeric(config$input$year)
  },error = function(e){
    logerror('The Year must be a number')
    stop()
  })
  
  #Validate nodes
  nodos <- c("nodoPrincipal" = nodoPrincipal, "nodoInput" = nodoInput, 
             "nodoFeature" = nodoFeature, "nodoTarget" = nodoTarget,
             "nodoCountry" = nodoCountry)
  
 
  
  check <- all(nodos)
  
  if(!check){
    
    nodosMalos <- names(nodos)[!nodos]
    
    logerror(paste0("Los nodos: ", paste(nodosMalos, collapse = ", "),
                    " estan mal estructurados!"), logger = 'log')
    stop()
    
  }
  
  #Validate Sep, check accepted ones
  separadoresAceptados <- config$input$sep %in% c(",", ";")
  
  if(!separadoresAceptados){
    
    logerror("Sep value must be ',' o ';' ", logger = 'log')
    stop()
    
  }
  
}
  
  

