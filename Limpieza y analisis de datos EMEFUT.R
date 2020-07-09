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
#Datos de porfesores
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

#Datos encargados base de datos y limpieza
Solo_encargados <- subset.data.frame(Datos_Encargados_Profesores_EMEFUT,
                                     Datos_Encargados_Profesores_EMEFUT$Usted.se.desempeña.como.=="Encargado EMEFUT")

Solo_encargados <- Solo_encargados %>%
  select("X.Cuál.es.su.nombre.",
         "Usted.se.desempeña.como.","X.Qué.sede.EMEFUT.se.encuentra.a.su.cargo.",
         "X.Con.qué.categoría.ha.estado.trabajando.durante.la.Cuarentena..enviando.videos..mensajes..entrenos..etc...",
         "Por.favor.brindar.un.número.de.teléfono.que.tenga.Whassap.para.comunicarnos.con.usted.") %>%
  distinct()
names(Solo_encargados) <- c("NOMBRE","FUNCION","SEDE","CATEGORIA","TELEFONO_CONTACTO")
#Separar las dos categorias
Solo_encargados<- Solo_encargados %>%
  separate(CATEGORIA,
           c("CAT_1","CAT_2"),
           ",") 
Solo_encargados_A <- subset.data.frame(Solo_encargados,
                                       !is.na(Solo_encargados$CAT_2))  
Solo_encargados_A$CAT_1 <- NULL
names(Solo_encargados_A) <- c("NOMBRE","FUNCION","SEDE","CATEGORIA","TELEFONO_CONTACTO")
Solo_encargados$CAT_2 <- NULL
names(Solo_encargados) <- c("NOMBRE","FUNCION","SEDE","CATEGORIA","TELEFONO_CONTACTO")
#Reunidos en una sola base de datos de encargados y eliminamos las demas
Solo_encargados <- rbind(Solo_encargados,
                         Solo_encargados_A)
rm(Solo_encargados_A)

#Datos entrenadores, base de datos y limpieza
Solo_entrenadores <- subset.data.frame(Datos_Encargados_Profesores_EMEFUT,
                                       Datos_Encargados_Profesores_EMEFUT$Usted.se.desempeña.como.=="Entrenador de Alto Desempeño EMEFUT (sólo entrenadores titulares)")
Solo_entrenadores <- Solo_entrenadores %>%
  select(c("X.Cuál.es.su.nombre..2",
           "Por.favor.brindar.un.número.de.teléfono.que.tenga.Whassap.para.comunicarnos.con.usted..2"))
names(Solo_entrenadores) <- c("NOMBRE","TELEFONO_CONTACTO")

Solo_entrenadores$SEDE <- NA
Solo_entrenadores$SEDE[Solo_entrenadores$NOMBRE=="Servio Haens Rodriguez Amperez"] <- "Muniguate"
Solo_entrenadores$SEDE[Solo_entrenadores$NOMBRE=="Walter William Estrada Morales"] <- "Capitalinos B-EMEFUT"
Solo_entrenadores$CATEGORIA <- "Equipo Mayor"
Solo_entrenadores$FUNCION <- "Entrenador de Alto Desempeño"
Solo_entrenadores <- Solo_entrenadores[,c("NOMBRE","FUNCION","SEDE","CATEGORIA","TELEFONO_CONTACTO")]

#Unir las tres bases de datos en una sola
profe_datos <-  rbind(Solo_encargados,
                      Solo_profes) 
profe_datos<- rbind(profe_datos,
                    Solo_entrenadores)  

#Limpiar mi area de trabajo
rm(Solo_encargados)  
rm(Solo_entrenadores)  
rm(Solo_profes)

save(profe_datos,
     file = "Sedes_Categorías_Profesores")

#------------------------UNA SOLA FUENTE PARA INFORME FINAL---------------------------
profe_datos_union<- profe_datos %>%
  select("NOMBRE","FUNCION","SEDE","CATEGORIA") 
names(categoria_datos_junio) <- c("SEDE","CATEGORIA","LLAMADAS_JUNIO","MENSAJES_JUNIO",
                                  "ENTRENOS_JUNIO")
categoria_datos_junio_union <- subset.data.frame(categoria_datos_junio,
                                                 (categoria_datos_junio$SEDE!="Alameda"&
                                                    categoria_datos_junio$SEDE!="Limón"&
                                                    categoria_datos_junio$SEDE!="Maestro"&
                                                    categoria_datos_junio$SEDE!="Paraiso 2"))
FINAL_JUNIO_EMEFUT <- merge(categoria_datos_junio_union,
                            profe_datos_union,
                            key=("SEDE"&"CATEGORIA"),
                            all = TRUE)
FINAL_JUNIO_EMEFUT <- FINAL_JUNIO_EMEFUT %>%
  group_by(SEDE,CATEGORIA) %>%
  summarise(NOMBRE,FUNCION,LLAMADAS_JUNIO=sum(LLAMADAS_JUNIO,na.rm = TRUE),
            MENSAJES_JUNIO=sum(MENSAJES_JUNIO,na.rm = TRUE),
            ENTRENOS_JUNIO=sum(ENTRENOS_JUNIO,na.rm = TRUE))

write.csv(FINAL_JUNIO_EMEFUT,
          file = "Informe RRHH EMEFUT junio 2020")
















