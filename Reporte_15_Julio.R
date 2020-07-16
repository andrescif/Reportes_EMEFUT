library(tidyverse)

#Cargar datos
Avances.hasta.el.jueves.16.de.julio <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Avances hasta el jueves 16 de julio.csv")

#Cambiar nombre a base de datos para usar variables
datos <- Avances.hasta.el.jueves.16.de.julio

#Colocar nombres de variables
names(datos) <-  c("Fecha de reporte","Fecha de contacto",
                   "Sede","Categoría","¿Llamadas?",
                   "Llamadas realizadas","Llamadas efectivas",
                   "¿Mensajes?", "Mensajes enviados",
                   "Mensajes efectivos","¿Entrenamientos?",
                   "¿Cuántos entrenamientos?", "%Recibió",
                   "%Realizó","Comentario")
rm(Avances.hasta.el.jueves.16.de.julio)

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

#Nombrar variables
datos$`Fecha de contacto` <- as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")
datos$Sede <- as.factor(datos$Sede)
datos$Categoría <- as.factor(datos$Categoría)



#Filtrar las fechas
datos %>%
  filter(datos$`Fecha de contacto`>"2020-06-30" &
           datos$`Fecha de contacto`<"2020-07-16")
datos_julio <- datos %>%
  filter(datos$`Fecha de contacto`>"2020-06-30" &
           datos$`Fecha de contacto`<"2020-07-16")

#Ordenar las categorías
datos_julio$Categoría <- ordered(datos_julio$Categoría,
                                 levels=c("Moscos","Infantil","Intermedia","Juvenil"))

Informe_Quincena_Julio <- datos_julio %>%
  group_by(Sede,
           Categoría) %>%
  summarise(Total_Llamadas=sum(`Llamadas efectivas`,na.rm = TRUE),
            Total_Mensajes=sum(`Mensajes efectivos`,na.rm = TRUE),
            Total_Entrenos=sum(`¿Cuántos entrenamientos?`,na.rm = TRUE))

Informe_Quincena_Julio <- subset.data.frame(Informe_Quincena_Julio,
                  !is.na(Informe_Quincena_Julio$Categoría))

Informe_Quincena_Julio <- subset.data.frame(Informe_Quincena_Julio, 
                  Informe_Quincena_Julio$Sede!= "Alameda" &
                  Informe_Quincena_Julio$Sede!= "Maestro" &
                  Informe_Quincena_Julio$Sede!= "Paraiso 2" &
                  Informe_Quincena_Julio$Sede!= "Limón")


#Cargar datos de profesores
levels(Informe_Quincena_Julio$Sede)
profe_nombres <- subset.data.frame(profe_datos,
                  select = c("NOMBRE","SEDE","CATEGORIA"))
names(profe_nombres) <- c("Nombre","Sede","Categoría")


left_join(profe_nombres,
          Informe_Quincena_Julio,
          by="Sede","Categoría")






