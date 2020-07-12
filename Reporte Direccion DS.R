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

#-------------------------------CORRECCION DE DATOS CON ERRORES---------------------------
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
datos[2747, "Fecha de contacto"] <- "2020-06-15"
datos[3772, "Fecha de contacto"] <- "2020-06-15"
datos[3083, "Fecha de contacto"] <- "2020-06-15"
datos[3082, "Fecha de contacto"] <- "2020-06-15"
datos[3081, "Fecha de contacto"] <- "2020-06-15"
datos[3080, "Fecha de contacto"] <- "2020-06-15"



#-------------------------CATEGORIZAR LAS VARIABLES ÚTILES-----------------------------
datos$`Fecha de contacto` <- as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")
datos$Sede <- as.factor(datos$Sede)
datos$Categoría <- as.factor(datos$Categoría)
datos$`¿Llamadas?` <- as.factor(datos$`¿Llamadas?`)
datos$`¿Mensajes?` <- as.factor(datos$`¿Mensajes?`)
datos$`¿Entrenamientos?` <- as.factor(datos$`¿Entrenamientos?`)
#Volver porcentajes
datos$`%Recibió` <- datos$`%Recibió`*.2
datos$`%Realizó` <- datos$`%Realizó`*.2

#Condicones
datos$`Fecha de contacto`[datos$`Fecha de contacto`>"2020-03-01" &
                            datos$`Fecha de contacto`<"2020-04-01"]
table(datos$`Fecha de contacto`[datos$`Fecha de contacto`>"2020-03-01" &
                                  datos$`Fecha de contacto`<"2020-04-01"])
datos$`Fecha de contacto`[datos$`Fecha de contacto`>"2020-03-30" &
                            datos$`Fecha de contacto`<"2020-05-01"]
table(datos$`Fecha de contacto`[datos$`Fecha de contacto`>"2020-03-30" &
                                  datos$`Fecha de contacto`<"2020-05-01"])
#Nueva variable de mes en el que relizó el contacto
datos$Mes_reporte <- NA
datos$Mes_reporte[datos$`Fecha de contacto`>"2020-03-01" &
                    datos$`Fecha de contacto`<"2020-04-01"] <- "MARZO"
datos$Mes_reporte[datos$`Fecha de contacto`>"2020-03-30" &
                    datos$`Fecha de contacto`<"2020-05-01"] <- "ABRIL"
datos$Mes_reporte[datos$`Fecha de contacto`>"2020-04-30" &
                    datos$`Fecha de contacto`<"2020-06-01"] <- "MAYO"
datos$Mes_reporte[datos$`Fecha de contacto`>"2020-05-31" &
                    datos$`Fecha de contacto`<"2020-07-01"] <- "JUNIO"
datos$Mes_reporte[datos$`Fecha de contacto`>"2020-06-30" &
                    datos$`Fecha de contacto`<"2020-08-01"] <- "JULIO"
table(datos$Mes_reporte)
datos$Mes_reporte <- as.factor(datos$Mes_reporte)
datos$Mes_reporte <- ordered(datos$Mes_reporte,
                             levels=c("MARZO","ABRIL","MAYO","JUNIO","JULIO"))









