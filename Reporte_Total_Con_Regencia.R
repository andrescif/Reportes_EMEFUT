library(tidyverse)

#Cargar datos
datos <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Avances hasta el jueves 29 de octubre.csv")

#Colocar nombres de variables
names(datos)<-  c("Fecha_de_reporte","Fecha_de_contacto",
                   "Sede","Categoría","¿Llamadas?",
                   "Llamadas_realizadas","Llamadas_efectivas",
                   "¿Mensajes?","Mensajes_enviados",
                   "Mensajes_efectivos","¿Entrenamientos?",
                   "¿Cuántos_entrenamientos?", "%Recibió",
                   "%Realizó","¿Entreno_nueva_normalidad?","¿Categoria_nueva_normalidad?",
                   "¿Turnos_nueva_normalidad?","Atendidos_nueva_normalidad","Comentario")


#----------------CORRECCION DE DATOS CON ERRORES &LIMPIEZA DE DATOS------------------------#

datos[218,"Llamadas_realizadas"] <- 15
datos[539,"Llamadas_realizadas"] <- 11
datos[393,"Llamadas_realizadas"] <- 16
datos[1585,"Llamadas_realizadas"] <- 15
datos[884, "Llamadas_realizadas"] <- 18
datos[921, "Llamadas_realizadas"] <- 10
datos[1700, "Llamadas_realizadas"] <- 16
datos[2193, "Llamadas_realizadas"] <- 14
datos[2522, "Llamadas_realizadas"] <- 12
datos[2796, "Llamadas_realizadas"] <- 15
datos[540,"Mensajes_enviados"] <- 22
datos[261,"Mensajes_enviados"] <- 16
datos[318,"Mensajes_enviados"] <- 16
datos[260,"Mensajes_enviados"] <- 13
datos[259,"Mensajes_enviados"] <- 12
datos[272,"Mensajes_enviados"] <- 15
datos[317,"Mensajes_enviados"] <- 11
datos[1361,"Mensajes_enviados"] <- 13
datos[1537,"Mensajes_enviados"] <- 14
datos[884, "Mensajes_enviados"] <- 18
datos[642, "Mensajes_enviados"] <- 16
datos[1012, "Mensajes_enviados"] <- 14
datos[1157, "Mensajes_enviados"] <- 20
datos[2636, "Mensajes_enviados"] <- 25
datos[2165, "Mensajes_enviados"] <- 23
datos[2068, "Mensajes_enviados"] <- 20
datos[2345, "Mensajes_enviados"] <- 16
datos[2710, "Mensajes_enviados"] <- 10
datos[2988, "Mensajes_enviados"] <- 25
datos[3182, "Mensajes_enviados"] <- 11
datos[2747, "Fecha_de_contacto"] <- "2020-06-15"
datos[3772, "Fecha_de_contacto"] <- "2020-06-15"
datos[3083, "Fecha_de_contacto"] <- "2020-06-15"
datos[3082, "Fecha_de_contacto"] <- "2020-06-15"
datos[3081, "Fecha_de_contacto"] <- "2020-06-15"
datos[3080, "Fecha_de_contacto"] <- "2020-06-15"
datos[4921, "Fecha_de_contacto"] <- "2020-07-27"
datos[4204, "Fecha_de_contacto"] <- "2020-07-13"
datos[4094, "Fecha_de_contacto"] <- "2020-07-10"
datos[4093, "Fecha_de_contacto"] <- "2020-07-09"
datos[4092, "Fecha_de_contacto"] <- "2020-07-08"
datos[4091, "Fecha_de_contacto"] <- "2020-07-07"
datos[4090, "Fecha_de_contacto"] <- "2020-07-06"
datos[5121, "Fecha_de_contacto"] <- "2020-08-03"
datos[5257, "Fecha_de_contacto"] <- "2020-08-05"
datos[5316, "Fecha_de_contacto"] <- "2020-08-06"
datos[5395, "Fecha_de_contacto"] <- "2020-08-07"
datos[5519, "Fecha_de_contacto"] <- "2020-08-10"
datos[5894, "Fecha_de_contacto"] <- "2020-08-10"
datos[5570, "Fecha_de_contacto"] <- "2020-08-11"
datos[5670, "Fecha_de_contacto"] <- "2020-08-11"
datos[5895, "Fecha_de_contacto"] <- "2020-08-11"
datos[5736, "Fecha_de_contacto"] <- "2020-08-12"
datos[5896, "Fecha_de_contacto"] <- "2020-08-12"
datos[5897, "Fecha_de_contacto"] <- "2020-08-13"
datos[5796, "Fecha_de_contacto"] <- "2020-08-14"
datos[5898, "Fecha_de_contacto"] <- "2020-08-14"
datos[5892, "Fecha_de_contacto"] <- "2020-08-17"
datos[5899, "Fecha_de_contacto"] <- "2020-08-17"
datos[5963, "Fecha_de_contacto"] <- "2020-08-18"
datos[6021, "Fecha_de_contacto"] <- "2020-08-19"
datos[6094, "Fecha_de_contacto"] <- "2020-08-20"
datos[6157, "Fecha_de_contacto"] <- "2020-08-20"
datos[6151, "Fecha_de_contacto"] <- "2020-08-21"
datos[6158, "Fecha_de_contacto"] <- "2020-08-21"
datos[6249, "Fecha_de_contacto"] <- "2020-08-24"
datos[6314, "Fecha_de_contacto"] <- "2020-08-25"
datos[6366, "Fecha_de_contacto"] <- "2020-08-26"
datos[6434, "Fecha_de_contacto"] <- "2020-08-27"
datos[6497, "Fecha_de_contacto"] <- "2020-08-29"
datos[5194, "Fecha_de_contacto"] <- "2020-06-15"
datos[6603, "Fecha_de_contacto"] <- "2020-08-31"
datos[6638, "Fecha_de_contacto"] <- "2020-09-01"
datos[6712, "Fecha_de_contacto"] <- "2020-09-02"
datos[6824, "Fecha_de_contacto"] <- "2020-09-04"
datos[6947, "Fecha_de_contacto"] <- "2020-09-07"
datos[7011, "Fecha_de_contacto"] <- "2020-09-08"
datos[7070, "Fecha_de_contacto"] <- "2020-09-09"
datos[7136, "Fecha_de_contacto"] <- "2020-09-10"
datos[7193, "Fecha_de_contacto"] <- "2020-09-11"
datos[7274, "Fecha_de_contacto"] <- "2020-09-14"
datos[7347, "Fecha_de_contacto"] <- "2020-09-16"
datos[6756, "Fecha_de_contacto"] <- "2020-09-03"
datos[7404, "Fecha_de_contacto"] <- "2020-09-17"
datos[7465, "Fecha_de_contacto"] <- "2020-09-18"
datos[7580, "Fecha_de_contacto"] <- "2020-09-21"
datos[7663, "Fecha_de_contacto"] <- "2020-09-22"
datos[7747, "Fecha_de_contacto"] <- "2020-09-24"
datos[8543, "Fecha_de_contacto"] <- "2020-09-13"
datos[7946, "Fecha_de_contacto"] <- "2020-09-29"
datos[8041, "Fecha_de_contacto"] <- "2020-09-30"
datos[8061, "Fecha_de_contacto"] <- "2020-10-01"
datos[8089, "Fecha_de_contacto"] <- "2020-10-02"
datos[8108, "Fecha_de_contacto"] <- "2020-10-02"
datos[8147, "Fecha_de_contacto"] <- "2020-10-05"
datos[8188, "Fecha_de_contacto"] <- "2020-10-06"
datos[8252, "Fecha_de_contacto"] <- "2020-10-07"
datos[8328, "Fecha_de_contacto"] <- "2020-10-08"
datos[8383, "Fecha_de_contacto"] <- "2020-10-09"
datos[8482, "Fecha_de_contacto"] <- "2020-10-12"
datos[8488, "Fecha_de_contacto"] <- "2020-10-12"
datos[8536, "Fecha_de_contacto"] <- "2020-10-13"
datos[8598, "Fecha_de_contacto"] <- "2020-10-14"
datos[8608, "Fecha_de_contacto"] <- "2020-10-14"
datos[8666, "Fecha_de_contacto"] <- "2020-10-15"
datos[8962, "Fecha_de_contacto"] <- "2020-10-15"
datos[8718, "Fecha_de_contacto"] <- "2020-10-16"
datos[8827, "Fecha_de_contacto"] <- "2020-10-19"
datos[8890, "Fecha_de_contacto"] <- "2020-10-19"
datos[8881, "Fecha_de_contacto"] <- "2020-10-20"
datos[8923, "Fecha_de_contacto"] <- "2020-10-21"
datos[8950, "Fecha_de_contacto"] <- "2020-10-22"
datos[9007, "Fecha_de_contacto"] <- "2020-10-22"
datos[9047, "Fecha_de_contacto"] <- "2020-10-26"
datos[9117, "Fecha_de_contacto"] <- "2020-10-26"
datos[9136, "Fecha_de_contacto"] <- "2020-10-26"
datos[9182, "Fecha_de_contacto"] <- "2020-10-27"
datos[9183, "Fecha_de_contacto"] <- "2020-10-27"
datos[9214, "Fecha_de_contacto"] <- "2020-10-28"
datos[9238, "Fecha_de_contacto"] <- "2020-10-28"
datos[9285, "Fecha_de_contacto"] <- "2020-10-29"
datos[9302, "Fecha_de_contacto"] <- "2020-10-29"
datos=datos[-8235,]

#Nombrar variables
datos$Fecha_de_contacto <- as.Date(datos$Fecha_de_contacto,format="%Y-%m-%d")
datos$Sede <- as.factor(datos$Sede)
datos$Categoría <- as.factor(datos$Categoría)
#Ordenar las categorías
datos$Categoría <- ordered(datos$Categoría,
                           levels=c("Moscos","Infantil","Intermedia","Juvenil"))
table(datos$Fecha_de_contacto)
datos$Fecha_de_contacto[datos$Fecha_de_contacto>"2020-04-19"]
#Filtrar fechas
datos<- datos %>%
filter(datos$Fecha_de_contacto>"2020-04-19")
#Agregar mes del contacto
datos$Mes_contacto<- months(datos$Fecha_de_contacto)
#Agregar el dia al contacto
datos$Dia_contacto <- weekdays(datos$Fecha_de_contacto)
#Traducir para tablas y graficos
  #Mes de contacto
table(datos$Mes_contacto,useNA = "ifany")
datos$Mes_contacto[datos$Mes_contacto=="April"] <- "Abril"
datos$Mes_contacto[datos$Mes_contacto=="August"] <- "Agosto"
datos$Mes_contacto[datos$Mes_contacto=="July"] <- "Julio"
datos$Mes_contacto[datos$Mes_contacto=="June"] <- "Junio"
datos$Mes_contacto[datos$Mes_contacto=="May"] <- "Mayo"
datos$Mes_contacto[datos$Mes_contacto=="October"] <- "Octubre"
datos$Mes_contacto[datos$Mes_contacto=="September"] <- "Septiembre"
datos$Mes_contacto <- ordered(datos$Mes_contacto,
                           levels=c("Abril","Mayo","Junio","Julio","Agosto",
                                    "Septiembre","Octubre"))
  #Dia de contacto
table(datos$Dia_contacto,useNA = "ifany")
datos$Dia_contacto[datos$Dia_contacto=="Friday"] <- "Viernes"
datos$Dia_contacto[datos$Dia_contacto=="Monday"] <- "Lunes"
datos$Dia_contacto[datos$Dia_contacto=="Saturday"] <- "Sábado"
datos$Dia_contacto[datos$Dia_contacto=="Sunday"] <- "Domingo"
datos$Dia_contacto[datos$Dia_contacto=="Thursday"] <- "Jueves"
datos$Dia_contacto[datos$Dia_contacto=="Tuesday"] <- "Martes"
datos$Dia_contacto[datos$Dia_contacto=="Wednesday"] <- "Miércoles"
datos$Dia_contacto <- ordered(datos$Dia_contacto,
                              levels=c("Lunes","Martes","Miércoles","Jueves","Viernes",
                                       "Sábado","Domingo"))
#Separar datos de la escuela y el Alto desempeño
datos_alto <- datos %>%
  filter(datos$Sede=="Capitalinos B-EMEFUT" |
           datos$Sede=="Muniguate")
datos_escuela <- datos %>%
filter(datos$Sede!="Capitalinos B-EMEFUT" & 
         datos$Sede!="Muniguate")
#Eliminar de datos de la escuela NA de categoría
table(is.na(datos_escuela$Categoría))
datos_escuela<- datos_escuela %>%
  filter(!is.na(datos_escuela$Categoría))

#--------------------------ANALISIS DE DATOS-----------------------------------------------#
#Un primer acercamiento a la data: fecha por mes y por dia
  #Por mes
ggplot(datos_escuela,
       aes(Mes_contacto,fill=Categoría))+
  theme_bw()+
  geom_bar()+
  geom_text(stat='count', 
            aes(label=..count..),
            position = position_stack(),
            vjust=0)+
  labs(title = "Reportes por Mes y Categoría",
       x="Mes",
       y="Cantidad de Reportes")
  #Por día
ggplot(datos_escuela,
       aes(Dia_contacto,fill=Categoría))+
  theme_bw()+
  geom_bar()+
  geom_text(stat='count', 
            aes(label=..count..),
            position = position_stack(),
            vjust=0)+
  labs(title = "Reportes por Día y Categoría",
       x="Día",
       y="Cantidad de Reportes")







