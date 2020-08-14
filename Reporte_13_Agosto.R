library(tidyverse)

#Cargar datos
Avances.hasta.el.jueves.13.de.agosto <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Avances hasta el jueves 13 de agosto.csv")

#Variable
datos <- Avances.hasta.el.jueves.13.de.agosto
rm(Avances.hasta.el.jueves.13.de.agosto)
#Colocar nombres de variables
names(datos) <-  c("Fecha de reporte","Fecha de contacto",
                   "Sede","Categoría","¿Llamadas?",
                   "Llamadas realizadas","Llamadas efectivas",
                   "¿Mensajes?", "Mensajes enviados",
                   "Mensajes efectivos","¿Entrenamientos?",
                   "¿Cuántos entrenamientos?", "%Recibió",
                   "%Realizó","Comentario")

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
datos[4921, "Fecha de contacto"] <- "2020-07-27"
datos[4204, "Fecha de contacto"] <- "2020-07-13"
datos[4094, "Fecha de contacto"] <- "2020-07-10"
datos[4093, "Fecha de contacto"] <- "2020-07-09"
datos[4092, "Fecha de contacto"] <- "2020-07-08"
datos[4091, "Fecha de contacto"] <- "2020-07-07"
datos[4090, "Fecha de contacto"] <- "2020-07-06"
#Nombrar variables
datos$`Fecha de contacto` <- as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")
datos$Sede <- as.factor(datos$Sede)
datos$Categoría <- as.factor(datos$Categoría)
#Ordenar las categorías
datos$Categoría <- ordered(datos$Categoría,
                                 levels=c("Moscos","Infantil","Intermedia","Juvenil"))
#Filtrar las fechas
datos_agosto<- datos %>%
  filter(datos$`Fecha de contacto`>"2020-07-30" &
           datos$`Fecha de contacto`<"2020-08-13")
#Resumen del reporte
Informe_Quincena_Agosto <- datos_agosto %>%
  group_by(Sede,
           Categoría) %>%
  summarise(Total_Llamadas=sum(`Llamadas efectivas`,na.rm = TRUE),
            Total_Mensajes=sum(`Mensajes efectivos`,na.rm = TRUE),
            Total_Entrenos=sum(`¿Cuántos entrenamientos?`,na.rm = TRUE))
#Limpiar la tabla
Informe_Quincena_Agosto <- subset.data.frame(Informe_Quincena_Agosto,
                                            !is.na(Informe_Quincena_Agosto$Categoría))
#Tabla de informe
write.csv(Informe_Quincena_Agosto,
          file = "Tabla Primera Quincena Agosto")
rm(list = ls())













