

clean_data <- function(df_merged, config){
  # TODO: validar pais y año
  
  year <- config$input$year
  country <- config$input$country
  
  # Crear mascara para target_row
  
  target_row_mask <- df_merged$year == year & df_merged$country == country
  
  #Borrar todos los NA excepto en target_row
  df_no_target <- df_merged[!target_row_mask, ]
  df_no_target <- na.omit(df_no_target)
  
  
  target_row <- df_merged[target_row_mask, ]
  df_final <- rbind(df_no_target, target_row)
  
  #Mirando solamente las columnas predictoras
  predict = target_row[4:ncol(target_row)]
  predict$fertilidad <- NaN #Uncomment for --Debug 
  
  #construyendo mascara
  boleano <- is.na(predict)
  boleano <- c(F, F, F, boleano)
  
  
  final_df = subset(df_final, select = !boleano)
  
  return(final_df)
  
  
}


 
