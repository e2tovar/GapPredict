#' @title validateConfigNodes
#'
#' @param config 
#'
#' @import logging
#' 

validateConfig <- function(config){
  #check names in Main and input nodes
  nodoPrincipal <- identical(names(config), c("input"))
  nodoInput <- identical(names(config$input), c("feature", "target", "country",
                                                "year", "sep"))
  
  #check whether there are empty feture, target, country and year
  nodoFeature <- !is.null(config$input$feature)
  nodoTarget <- !is.null(config$input$target)
  nodoCountry <- !is.null(config$input$country)
  nodoYear <- !is.null(config$input$year)
  
  #Check and cast year as numeric
  config$input$year <- as.numeric(config$input$year)
  if (is.na(config$input$year)){
    logerror('The Year must be a number')
    stop()
  }
  
    
  #Validate nodes
  nodos <- c("nodoPrincipal" = nodoPrincipal, "nodoInput" = nodoInput, 
             "nodoFeature" = nodoFeature, "nodoTarget" = nodoTarget,
             "nodoCountry" = nodoCountry, 'nodoYear'= nodoYear)
  
 
  
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
  
  

