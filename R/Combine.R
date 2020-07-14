# Iniciando


# Loading libraries

library(reshape2)

combine_data <- function(df_list){
  
  # Melting data sets and assigning name to columns
  melted_list <- list()
  for (name in names(df_list)){
    df_melted <- melt(df_list[[name]], id.vars = c("country"), variable.name = "year", value.name = name)
    melted_list <- c(melted_list, list(df_melted))
  }
  
  df_merged <- Reduce(function(x, y) merge(x, y, all=TRUE), melted_list, accumulate=FALSE)
  return (df_merged)
}

