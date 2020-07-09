library(haven)
library(tidyverse)

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
rm(Avances.hasta.domingo.28.de.junio)


#----------------LA BASE DE DATOS COMPLETA DE PERSONAL EMEFUT--------------------------
#Datos de porfesores y encargados completa
Datos_Encargados_Profesores_EMEFUT <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Datos de personal EMEFUT.csv")

#Variables para utilizar
Datos_Encargados_Profesores_EMEFUT$Usted.se.desempeña.como.<- 
  as.factor(Datos_Encargados_Profesores_EMEFUT$Usted.se.desempeña.como.)

#Profesores base de datos y limpieza
Solo_profes <- subset.data.frame(Datos_Encargados_Profesores_EMEFUT,
                                 Datos_Encargados_Profesores_EMEFUT$Usted.se.desempeña.como.=="Profesor EMEFUT")

Solo_profes <- Solo_profes %>%
  select("X.Cuál.es.su.nombre..1",
         "Usted.se.desempeña.como.","X.A.qué.sede.EMEFUT.pertenece.",
         "X.Con.qué.categoría.ha.estado.trabajando.durante.la.Cuarentena..enviando.videos..mensajes..entrenos..etc....1",
         "Por.favor.brindar.un.número.de.teléfono.que.tenga.Whassap.para.comunicarnos.con.usted..1") %>%
  distinct()
names(Solo_profes) <- c("NOMBRE","FUNCION","SEDE","CATEGORIA","TELEFONO_CONTACTO")

Solo_profes <- Solo_profes %>%
  separate(CATEGORIA,
           c("CAT_1","CAT_2"),
           ",")
Solo_profes_A <- subset.data.frame(Solo_profes,
                                   !is.na(Solo_profes$CAT_2))
Solo_profes_A$CAT_1 <- NULL
names(Solo_profes_A) <- c("NOMBRE","FUNCION","SEDE","CATEGORIA","TELEFONO_CONTACTO")
Solo_profes$CAT_2 <- NULL
names(Solo_profes) <- c("NOMBRE","FUNCION","SEDE","CATEGORIA","TELEFONO_CONTACTO")
#Los profes en una base de datos
Solo_profes <- rbind(Solo_profes,
                     Solo_profes_A)
rm(Solo_profes_A)



