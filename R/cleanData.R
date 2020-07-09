# Iniciando


# Loading libraries

library(reshape2)

# Loading data ---- This is already loaded in previous script

asesinatos <- read.csv('asesinatos_mujeres.csv', sep=',', check.names = FALSE)
poblacion <- read.csv('poblacion_total.csv', sep=',', check.names = FALSE)
desempleo <- read.csv('desempleo.csv', sep=',', check.names = FALSE)
fertilidad <- read.csv('fertilidad.csv', sep=',', check.names = FALSE)
pib <- read.csv('pib.csv', sep=',', check.names = FALSE)

# Melting data sets and assigning name to columns

#list_df_names <- list("asesinatos", "poblacion", "desempleo", "fertilidad", "pib")

asesinatos_L <- melt(asesinatos, id.vars = c("country"), variable.name = "year", value.name = "asesinatos")
poblacion_L = melt(poblacion, id.vars = c("country"), variable.name = "year", value.name = "poblacion")
desempleo_L = melt(desempleo, id.vars = c("country"), variable.name = "year", value.name = "desempleo")
fertilidad_L = melt(fertilidad, id.vars = c("country"), variable.name = "year", value.name="fertilidad")
pib_L = melt(pib, id.vars = c("country"), variable.name = "year", value.name = "pib")


# Merging all sets:

df_list <- list(asesinatos_L, poblacion_L, desempleo_L, fertilidad_L, pib_L)

merged <- Reduce(function(x, y) merge(x, y, all=TRUE), df_list, accumulate=FALSE)
