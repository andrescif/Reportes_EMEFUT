library(haven)
library(tidyverse)

#Cargar datos
Avances.hasta.domingo.12.de.julio <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Avances hasta domingo 12 de julio.csv")

#Cambiar nombre para utilizar variables
datos <- Avances.hasta.domingo.12.de.julio

names(datos) <-  c("Fecha de reporte","Fecha de contacto",
                   "Sede","Categoría","¿Llamadas?",
                   "Llamadas realizadas","Llamadas efectivas",
                   "¿Mensajes?", "Mensajes enviados",
                   "Mensajes efectivos","¿Entrenamientos?",
                   "¿Cuántos entrenamientos?", "%Recibió",
                   "%Realizó","Comentario")
rm(Avances.hasta.domingo.12.de.julio)










