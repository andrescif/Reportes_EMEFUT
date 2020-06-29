library(haven)
library(tidyverse)
library(stringr)

#-------------------------CARGAR DATOS Y NOMBRAR VARIABLES---------------------------------#
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

#-------------------------------CORRECCION DE DATOS CON ERRORES---------------------------#
datos[218,"Llamadas realizadas"] <- 15
datos[539,"Llamadas realizadas"] <- 11
datos[393,"Llamadas realizadas"] <- 16
datos[1585,"Llamadas realizadas"] <- 15
datos[884, "Llamadas realizadas"] <- 18
datos[921, "Llamadas realizadas"] <- 10
datos[1700, "Llamadas realizadas"] <- 16
datos[2193, "Llamadas realizadas"] <- 14
datos[2522, "Llamadas realizadas"] <- 12
datos[2796, "Llamadas realizadas"] <- 15
datos[540,"Mensajes enviados"] <- 22
datos[261,"Mensajes enviados"] <- 16
datos[318,"Mensajes enviados"] <- 16
datos[260,"Mensajes enviados"] <- 13
datos[259,"Mensajes enviados"] <- 12
datos[272,"Mensajes enviados"] <- 15
datos[317,"Mensajes enviados"] <- 11
datos[1361,"Mensajes enviados"] <- 13
datos[1537,"Mensajes enviados"] <- 14
datos[884, "Mensajes enviados"] <- 18
datos[642, "Mensajes enviados"] <- 16
datos[1012, "Mensajes enviados"] <- 14
datos[1157, "Mensajes enviados"] <- 20
datos[2636, "Mensajes enviados"] <- 25
datos[2165, "Mensajes enviados"] <- 23
datos[2068, "Mensajes enviados"] <- 20
datos[2345, "Mensajes enviados"] <- 16
datos[2710, "Mensajes enviados"] <- 10
datos[2988, "Mensajes enviados"] <- 25
datos[3182, "Mensajes enviados"] <- 11
rm(Avances.hasta.domingo.28.de.junio)

#--------------------CREAR Y UNIR BASES DE DATOS PARA ANALISIS-----------------------------#

#Separar las categorías para que todos tengan sólo una
Datos.profesores_categorias.EMEFUT %>%
  separate(Categoría,
           c("Categoría","Cateogira2"),
           ",")

profe_datos <- Datos.profesores_categorias.EMEFUT %>%
  separate(Categoría,
           c("Categoría","Cateogira2"),",")

#Corregir tipos de variables
datos$Sede <- as.factor(datos$Sede)
datos$Categoría <- as.factor(datos$Categoría)
profe_datos$Categoría <- as.factor(profe_datos$Categoría)
profe_datos$Cateogira2 <- as.factor(profe_datos$Cateogira2)

as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")
datos$`Fecha de contacto` <- as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")

#Solo los datos de junio
datos %>%
  filter(datos$`Fecha de contacto`>"2020-05-31"&
           datos$`Fecha de contacto`<"2020-07-01")

datos_junio <- datos %>%
  filter(datos$`Fecha de contacto`>"2020-05-31"&
           datos$`Fecha de contacto`<"2020-07-01")

profe_datos <- subset.data.frame(profe_datos,
                                 select = c("Sede","Categoría","Nombre del Profesor","NIT"))
save(profe_datos,
     file = "Sedes_Categorías_Profesores")



