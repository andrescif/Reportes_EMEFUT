library(tidyverse)

#Cargar datos
Avances.hasta.el.miercoles.16.de.septiembre <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Avances hasta el miercoles 16 de septiembre.csv")
#Variable
datos <- Avances.hasta.el.miercoles.16.de.septiembre
rm(Avances.hasta.el.miercoles.16.de.septiembre)
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
datos[5121, "Fecha de contacto"] <- "2020-08-03"
datos[5257, "Fecha de contacto"] <- "2020-08-05"
datos[5316, "Fecha de contacto"] <- "2020-08-06"
datos[5395, "Fecha de contacto"] <- "2020-08-07"
datos[5519, "Fecha de contacto"] <- "2020-08-10"
datos[5894, "Fecha de contacto"] <- "2020-08-10"
datos[5570, "Fecha de contacto"] <- "2020-08-11"
datos[5670, "Fecha de contacto"] <- "2020-08-11"
datos[5895, "Fecha de contacto"] <- "2020-08-11"
datos[5736, "Fecha de contacto"] <- "2020-08-12"
datos[5896, "Fecha de contacto"] <- "2020-08-12"
datos[5897, "Fecha de contacto"] <- "2020-08-13"
datos[5796, "Fecha de contacto"] <- "2020-08-14"
datos[5898, "Fecha de contacto"] <- "2020-08-14"
datos[5892, "Fecha de contacto"] <- "2020-08-17"
datos[5899, "Fecha de contacto"] <- "2020-08-17"
datos[5963, "Fecha de contacto"] <- "2020-08-18"
datos[6021, "Fecha de contacto"] <- "2020-08-19"
datos[6094, "Fecha de contacto"] <- "2020-08-20"
datos[6157, "Fecha de contacto"] <- "2020-08-20"
datos[6151, "Fecha de contacto"] <- "2020-08-21"
datos[6158, "Fecha de contacto"] <- "2020-08-21"
datos[6249, "Fecha de contacto"] <- "2020-08-24"
datos[6314, "Fecha de contacto"] <- "2020-08-25"
datos[6366, "Fecha de contacto"] <- "2020-08-26"
datos[6434, "Fecha de contacto"] <- "2020-08-27"
datos[6497, "Fecha de contacto"] <- "2020-08-29"
datos[5194, "Fecha de contacto"] <- "2020-06-15"
datos[6603, "Fecha de contacto"] <- "2020-08-31"
datos[6638, "Fecha de contacto"] <- "2020-09-01"
datos[6712, "Fecha de contacto"] <- "2020-09-02"
datos[6824, "Fecha de contacto"] <- "2020-09-04"
datos[6947, "Fecha de contacto"] <- "2020-09-07"
datos[7011, "Fecha de contacto"] <- "2020-09-08"
datos[7070, "Fecha de contacto"] <- "2020-09-09"
datos[7136, "Fecha de contacto"] <- "2020-09-10"
datos[7193, "Fecha de contacto"] <- "2020-09-11"
datos[7274, "Fecha de contacto"] <- "2020-09-14"
datos[7347, "Fecha de contacto"] <- "2020-09-16"
datos[6756, "Fecha de contacto"] <- "2020-09-03"
#Nombrar variables
datos$`Fecha de contacto` <- as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")
datos$Sede <- as.factor(datos$Sede)
datos$Categoría <- as.factor(datos$Categoría)
#Ordenar las categorías
datos$Categoría <- ordered(datos$Categoría,
                           levels=c("Moscos","Infantil","Intermedia","Juvenil"))
#Filtrar las fechas
datos_septiembre<- datos %>%
  filter(datos$`Fecha de contacto`>"2020-08-29" &
           datos$`Fecha de contacto`<"2020-09-17")
#Resumen del reporte
Informe_Quincena_Septiembre <- datos_septiembre %>%
  group_by(Sede,
           Categoría) %>%
  summarise(Total_Llamadas=sum(`Llamadas efectivas`,na.rm = TRUE),
            Total_Mensajes=sum(`Mensajes efectivos`,na.rm = TRUE),
            Total_Entrenos=sum(`¿Cuántos entrenamientos?`,na.rm = TRUE))
#Limpiar la tabla
Informe_Quincena_Septiembre <- subset.data.frame(Informe_Quincena_Septiembre,
                                             !is.na(Informe_Quincena_Septiembre$Categoría))
#Tabla de informe
write.csv(Informe_Quincena_Septiembre,
          file = "Tabla Primera Quincena Septiembre")
rm(list = ls())

