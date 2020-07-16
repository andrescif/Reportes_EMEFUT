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

#Número único para unir las base de datos
levels(profe_nombres$Sede)
#Sedes de los nombres de profesores
profe_nombres$A[profe_nombres$Sede=="Bethania"] <- 1
profe_nombres$A[profe_nombres$Sede=="Campo Marte"] <- 2
profe_nombres$A[profe_nombres$Sede=="Cantón 21"] <- 3
profe_nombres$A[profe_nombres$Sede=="Castillo Lara"] <- 4
profe_nombres$A[profe_nombres$Sede=="Chácara"] <- 5
profe_nombres$A[profe_nombres$Sede=="Florida"] <- 6
profe_nombres$A[profe_nombres$Sede=="Gerona"] <- 7
profe_nombres$A[profe_nombres$Sede=="Justo Rufino Barrios"] <- 8
profe_nombres$A[profe_nombres$Sede=="Lourdes"] <- 9
profe_nombres$A[profe_nombres$Sede=="Milles Rock"] <- 10
profe_nombres$A[profe_nombres$Sede=="Nimajuyú"] <- 11
profe_nombres$A[profe_nombres$Sede=="Proyecto 4-10"] <- 12
profe_nombres$A[profe_nombres$Sede=="Roosevelt"] <- 13
profe_nombres$A[profe_nombres$Sede=="San Francisco de Asís"] <- 14
profe_nombres$A[profe_nombres$Sede=="Santa Fe"] <- 15
profe_nombres$A <- profe_nombres$A*10
#Categorías de los nombres de profesores
levels(profe_nombres$Categoría)
profe_nombres$B[profe_nombres$Categoría=="Moscos"] <- 1
profe_nombres$B[profe_nombres$Categoría=="Infantil"] <- 2
profe_nombres$B[profe_nombres$Categoría=="Intermedia"] <- 3
profe_nombres$B[profe_nombres$Categoría=="Juvenil"] <- 4
#Numero único
profe_nombres$NUM_UNICO <- profe_nombres$A+profe_nombres$B

#Sedes del resumen de reportes
levels(Informe_Quincena_Julio$Sede)
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Bethania"] <- 1
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Campo Marte"] <- 2
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Cantón 21"] <- 3
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Castillo Lara"] <- 4
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Chácara"] <- 5
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Florida"] <- 6
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Gerona"] <- 7
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Justo Rufino Barrios"] <- 8
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Lourdes"] <- 9
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Milles Rock"] <- 10
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Nimajuyú"] <- 11
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Proyecto 4-10"] <- 12
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Roosevelt"] <- 13
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="San Francisco de Asís"] <- 14
Informe_Quincena_Julio$A[Informe_Quincena_Julio$Sede=="Santa Fe"] <- 15
Informe_Quincena_Julio$A <- Informe_Quincena_Julio$A*10
#Categorías de los nombres de profesores
levels(Informe_Quincena_Julio$Categoría)
Informe_Quincena_Julio$B[Informe_Quincena_Julio$Categoría=="Moscos"] <- 1
Informe_Quincena_Julio$B[Informe_Quincena_Julio$Categoría=="Infantil"] <- 2
Informe_Quincena_Julio$B[Informe_Quincena_Julio$Categoría=="Intermedia"] <- 3
Informe_Quincena_Julio$B[Informe_Quincena_Julio$Categoría=="Juvenil"] <- 4
#Numero único
Informe_Quincena_Julio$NUM_UNICO <- Informe_Quincena_Julio$A+Informe_Quincena_Julio$B

#Unir las dos en una sola tabla para informe
profe_nombres <- profe_nombres %>%
  select("Nombre",
         "NUM_UNICO")
Informe_Quincena_Julio<- Informe_Quincena_Julio[,c(8,1,2,3,4,5,6,7)]

Tabla_Final_Informe <- left_join(profe_nombres,
          Informe_Quincena_Julio,
          by="NUM_UNICO")

Tabla_Final_Informe <- Tabla_Final_Informe %>%
  select("Nombre","Total_Llamadas","Total_Mensajes","Total_Entrenos")

write.csv(Tabla_Final_Informe,
          file = "Tabla Informe Quincena Julio 2020")












