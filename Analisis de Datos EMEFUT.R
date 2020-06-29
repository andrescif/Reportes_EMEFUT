library(haven)
library(tidyverse)

#Carcgar datos
Avances.hasta.domingo.28.de.junio <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Avances hasta domingo 28 de junio.csv")
Datos.profesores_categorias.EMEFUT <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Datos profesores_categorias EMEFUT.csv")

#Cambiar nombre para utilizar variables
datos <- Avances.hasta.domingo.28.de.junio

names(datos) <-  c("Fecha de reporte","Fecha de contacto",
                   "Sede","Categoría","¿Llamadas?",
                   "Llamadas realizadas","Llamadas efectivas",
                   "¿Mensajes?", "Mensajes enviados",
                   "Mensajes efectivos","¿Entrenamientos?",
                   "¿Cuántos entrenamientos?", "%Recibió",
                   "%Realizó","Comentario")

names(Datos.profesores_categorias.EMEFUT) <- c("Fecha de reporte","Nombre del Profesor",
                                               "Sede","Categoría","NIT")






