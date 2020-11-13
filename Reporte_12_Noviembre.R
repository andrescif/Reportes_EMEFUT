library(tidyverse)
#Cargar datos
datos <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Avances hasta el jueves 12 de noviembre.csv")
#Colocar nombres de variables
names(datos) <-  c("Fecha de reporte","Fecha de contacto",
                   "Sede","Categoría","¿Llamadas?",
                   "Llamadas realizadas","Llamadas efectivas",
                   "¿Mensajes?", "Mensajes enviados",
                   "Mensajes efectivos","¿Entrenamientos?",
                   "¿Cuántos entrenamientos?", "%Recibió",
                   "%Realizó","¿Entreno nueva normalidad?","¿Categoria nueva normalidad?",
                   "¿Turnos nueva normalidad?","Atendidos nueva normalidad","Comentario")
#Limpiar los datos
datos$`Fecha de contacto`<- as.character(datos$`Fecha de contacto`)
substring(datos$`Fecha de contacto`,1,4) <- "2020"
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
datos=datos[-8235,] 
#Nombrar variables
datos$`Fecha de contacto` <- as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")
datos$Sede <- as.factor(datos$Sede)
datos$Categoría <- as.factor(datos$Categoría)
#Ordenar las categorías
datos$Categoría <- ordered(datos$Categoría,
                           levels=c("Moscos","Infantil","Intermedia","Juvenil"))
#Nombrar variables
datos$`Fecha de contacto` <- as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")
datos$Sede <- as.factor(datos$Sede)
datos$Categoría <- as.factor(datos$Categoría)
#Ordenar las categorías
datos$Categoría <- ordered(datos$Categoría,
                           levels=c("Moscos","Infantil","Intermedia","Juvenil"))
#Filtrar las fechas
datos_noviembre<- datos %>%
  filter(datos$`Fecha de contacto`>"2020-10-28" &
           datos$`Fecha de contacto`<"2020-11-13")
#Resumen del reporte
Informe_Primera_Quincena_noviembre <- datos_noviembre %>%
  group_by(Sede,
           Categoría) %>%
  summarise(Total_Llamadas=sum(`Llamadas efectivas`,na.rm = TRUE),
            Total_Mensajes=sum(`Mensajes efectivos`,na.rm = TRUE),
            Total_Entrenos=sum(`¿Cuántos entrenamientos?`,na.rm = TRUE))
#Limpiar la tabla
Informe_Primera_Quincena_noviembre <- subset.data.frame(Informe_Primera_Quincena_noviembre,
                                                      !is.na(Informe_Primera_Quincena_noviembre$Categoría))
#Tabla de informe
write.csv(Informe_Primera_Quincena_noviembre,
          file = "Tabla Primera Quincena Noviembre")
rm(list = ls())




