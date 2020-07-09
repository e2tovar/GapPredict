

clean_data <- function(df_merged, config){
  browser()
  # TODO: validar pais y año
  
  year <- config$input$year
  country <- config$input$country
  
  # Comprobar si hay NA en la fila del target
  
  target_row <- df_merged[df_merged[year] == year & df_merged[country] == country]
  
  
  
}