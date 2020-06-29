library(haven)
library(tidyverse)
library(stringr)

#-------------------------CARGAR DATOS Y NOMBRAR VARIABLES---------------------------------
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

#--------------------CREAR Y UNIR BASES DE DATOS PARA ANALISIS-----------------------------

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

#-------------------LLAVE DE CATEGORIAS EMEFUT-------------------------------------------
levels(categoria_datos_junio$Sede)
a <- levels(categoria_datos_junio$Sede)
b <- levels(categoria_datos_junio$Categoría)
a*b
combn(a,b)
?combn
combn(a,b,m="all")
combn(a,b,m=100)
combn(a,b,m=1)
a+b
facs(a)
list(facs(a))
rbind(a,b)
expand_grid(a,b)
21*7
llave_categorias_emefut <- as.data.frame(expand_grid(a,b))
rm(a)
rm(b)
a <- levels(categoria_datos_junio$Sede)
rm(a)
rm(a_a)
View(llave_categorias_emefut)

#Formulación de la llave
names(llave_categorias_emefut) <- c("Sede","Categoría")
View(llave_categorias_emefut)
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Alameda"] <- 1
View(llave_categorias_emefut)
levels(llave_categorias_emefut$Sede)
llave_categorias_emefut$Sede<- as.factor(llave_categorias_emefut$Sede)
llave_categorias_emefut$Categoría <- as.factor(llave_categorias_emefut$Categoría)
levels(llave_categorias_emefut$Sede)
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Alameda"] <- 1
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Bethania"] <- 2
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Campo Marte"] <- 3
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Cantón 21"] <- 4
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Capitalinos B-EMEFUT"] <- 5
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Castillo Lara"] <- 6
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Chácara"] <- 7
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Florida"] <- 8
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Gerona"] <- 9
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Justo Rufino Barrios"] <- 10
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Limón"] <- 11
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Lourdes"] <- 12
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Maestro"] <- 13
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Milles Rock"] <- 14
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Muniguate"] <- 15
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Nimajuyú"] <- 16
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Paraiso 2"] <- 17
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Proyecto 4-10"] <- 18
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Roosevelt"] <- 19
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="San Francisco de Asís"] <- 20
llave_categorias_emefut$a[llave_categorias_emefut$Sede=="Santa Fe"] <- 21
llave_categorias_emefut$a=llave_categorias_emefut$a*10
levels(llave_categorias_emefut$Categoría)
llave_categorias_emefut$b[llave_categorias_emefut$Categoría=="Equipo Mayor"] <- 1
llave_categorias_emefut$b[llave_categorias_emefut$Categoría=="Equipo Mayor"] <- 1
llave_categorias_emefut$b[llave_categorias_emefut$Categoría=="Infantil"] <- 2
llave_categorias_emefut$b[llave_categorias_emefut$Categoría=="Intermedia"] <- 3
llave_categorias_emefut$b[llave_categorias_emefut$Categoría=="Juvenil"] <- 4
llave_categorias_emefut$b[llave_categorias_emefut$Categoría=="Moscos"] <- 5
llave_categorias_emefut$b[llave_categorias_emefut$Categoría=="Sub-15"] <- 6
llave_categorias_emefut$b[llave_categorias_emefut$Categoría=="Sub-18"] <- 7
llave_categorias_emefut$CAT_EMEFUT=llave_categorias_emefut$a+llave_categorias_emefut$b
llave_categorias_emefut$a <- NULL
llave_categorias_emefut$b <- NULL
save(llave_categorias_emefut,
file = "Numeracion para Categorias EMEFUT")
View(profe_datos)
datos_junio$Sede<- as.factor(datos_junio$Sede)
View(datos_junio)
View(datos_junio)
datos_junio$a[datos_junio$Sede=="Alameda"] <- 1
datos_junio$a[datos_junio$Sede=="Bethania"] <- 2
datos_junio$a[datos_junio$Sede=="Campo Marte"] <- 3
datos_junio$a[datos_junio$Sede=="Cantón 21"] <- 4
datos_junio$a[datos_junio$Sede=="Capitalinos B-EMEFUT"] <- 5
datos_junio$a[datos_junio$Sede=="Castillo Lara"] <- 6
datos_junio$a[datos_junio$Sede=="Chácara"] <- 7
datos_junio$a[datos_junio$Sede=="Florida"] <- 8
datos_junio$a[datos_junio$Sede=="Gerona"] <- 9
datos_junio$a[datos_junio$Sede=="Justo Rufino Barrios"] <- 10
datos_junio$a[datos_junio$Sede=="Limón"] <- 11
datos_junio$a[datos_junio$Sede=="Lourdes"] <- 12
datos_junio$a[datos_junio$Sede=="Maestro"] <- 13
datos_junio$a[datos_junio$Sede=="Milles Rock"] <- 14
datos_junio$a[datos_junio$Sede=="Muniguate"] <- 15
datos_junio$a[datos_junio$Sede=="Nimajuyú"] <- 16
datos_junio$a[datos_junio$Sede=="Paraiso 2"] <- 17
datos_junio$a[datos_junio$Sede=="Proyecto 4-10"] <- 18
datos_junio$a[datos_junio$Sede=="Roosevelt"] <- 19
datos_junio$a[datos_junio$Sede=="San Francisco de Asís"] <- 20
datos_junio$a[datos_junio$Sede=="Santa Fe"] <- 21
datos_junio$a=datos_junio$a*10
datos_junio$b[datos_junio$Categoría=="Equipo Mayor"] <- 1
datos_junio$b[datos_junio$Categoría=="Infantil"] <- 2
datos_junio$b[datos_junio$Categoría=="Intermedia"] <- 3
datos_junio$b[datos_junio$Categoría=="Juvenil"] <- 4
datos_junio$b[datos_junio$Categoría=="Moscos"] <- 5
datos_junio$b[datos_junio$Categoría=="Sub-15"] <- 6
datos_junio$b[datos_junio$Categoría=="Sub-18"] <- 7
datos_junio$CAT_EMEFUT=datos_junio$a+datos_junio$b
datos_junio$a <- NULL
datos_junio$b <- NULL
#En los datos de profes
profe_datos$Sede<- as.factor(profe_datos$Sede)
profe_datos$Categoría <- as.factor(profe_datos$Categoría)
profe_datos$a[profe_datos$Sede=="Alameda"] <- 1
profe_datos$a[profe_datos$Sede=="Bethania"] <- 2
profe_datos$a[profe_datos$Sede=="Campo Marte"] <- 3
profe_datos$a[profe_datos$Sede=="Cantón 21"] <- 4
profe_datos$a[profe_datos$Sede=="Capitalinos B-EMEFUT"] <- 5
profe_datos$a[profe_datos$Sede=="Castillo Lara"] <- 6
profe_datos$a[profe_datos$Sede=="Chácara"] <- 7
profe_datos$a[profe_datos$Sede=="Florida"] <- 8
profe_datos$a[profe_datos$Sede=="Gerona"] <- 9
profe_datos$a[profe_datos$Sede=="Justo Rufino Barrios"] <- 10
profe_datos$a[profe_datos$Sede=="Limón"] <- 11
profe_datos$a[profe_datos$Sede=="Lourdes"] <- 12
profe_datos$a[profe_datos$Sede=="Maestro"] <- 13
profe_datos$a[profe_datos$Sede=="Milles Rock"] <- 14
profe_datos$a[profe_datos$Sede=="Muniguate"] <- 15
profe_datos$a[profe_datos$Sede=="Nimajuyú"] <- 16
profe_datos$a[profe_datos$Sede=="Paraiso 2"] <- 17
profe_datos$a[profe_datos$Sede=="Proyecto 4-10"] <- 18
profe_datos$a[profe_datos$Sede=="Roosevelt"] <- 19
profe_datos$a[profe_datos$Sede=="San Francisco de Asís"] <- 20
profe_datos$a[profe_datos$Sede=="Santa Fe"] <- 21
profe_datos$a=profe_datos$a*10
profe_datos$b[profe_datos$Categoría=="Equipo Mayor"] <- 1
profe_datos$b[profe_datos$Categoría=="Infantil"] <- 2
profe_datos$b[profe_datos$Categoría=="Intermedia"] <- 3
profe_datos$b[profe_datos$Categoría=="Juvenil"] <- 4
profe_datos$b[profe_datos$Categoría=="Moscos"] <- 5
profe_datos$b[profe_datos$Categoría=="Sub-15"] <- 6
profe_datos$b[profe_datos$Categoría=="Sub-18"] <- 7
profe_datos$CAT_EMEFUT=profe_datos$a+profe_datos$b
profe_datos$a <- NULL
profe_datos$b <- NULL
rm(llave_categorias_emefut)
View(profe_datos)
levles(profe_datos$Sede)
levels(profe_datos$Sedes)
levels(profe_datos$Sede)
profe_datos$a[profe_datos$Sede=="MIlles Rock"] <- 14
profe_datos$a[profe_datos$Sede=="Proyecto"] <- 18
profe_datos$a[profe_datos$Sede=="Alameda"] <- 1
profe_datos$a[profe_datos$Sede=="Bethania"] <- 2
profe_datos$a[profe_datos$Sede=="Campo Marte"] <- 3
profe_datos$a[profe_datos$Sede=="Cantón 21"] <- 4
profe_datos$a[profe_datos$Sede=="Capitalinos B-EMEFUT"] <- 5
profe_datos$a[profe_datos$Sede=="Castillo Lara"] <- 6
profe_datos$a[profe_datos$Sede=="Chácara"] <- 7
profe_datos$a[profe_datos$Sede=="Florida"] <- 8
profe_datos$a[profe_datos$Sede=="Gerona"] <- 9
profe_datos$a[profe_datos$Sede=="Justo Rufino Barrios"] <- 10
profe_datos$a[profe_datos$Sede=="Limón"] <- 11
profe_datos$a[profe_datos$Sede=="Lourdes"] <- 12
profe_datos$a[profe_datos$Sede=="Maestro"] <- 13
profe_datos$a[profe_datos$Sede=="MIlles Rock"] <- 14
profe_datos$a[profe_datos$Sede=="Muniguate"] <- 15
profe_datos$a[profe_datos$Sede=="Nimajuyú"] <- 16
profe_datos$a[profe_datos$Sede=="Paraiso 2"] <- 17
profe_datos$a[profe_datos$Sede=="Proyecto"] <- 18
profe_datos$a[profe_datos$Sede=="Roosevelt"] <- 19
profe_datos$a[profe_datos$Sede=="San Francisco de Asís"] <- 20
profe_datos$a[profe_datos$Sede=="Santa Fe"] <- 21
profe_datos$a=profe_datos$a*10
profe_datos$b[profe_datos$Categoría=="Equipo Mayor"] <- 1
profe_datos$b[profe_datos$Categoría=="Infantil"] <- 2
profe_datos$b[profe_datos$Categoría=="Intermedia"] <- 3
profe_datos$b[profe_datos$Categoría=="Juvenil"] <- 4
profe_datos$b[profe_datos$Categoría=="Moscos"] <- 5
profe_datos$b[profe_datos$Categoría=="Sub-15"] <- 6
profe_datos$b[profe_datos$Categoría=="Sub-18"] <- 7
profe_datos$CAT_EMEFUT=profe_datos$a+profe_datos$b
profe_datos$a <- NULL
profe_datos$b <- NULL
#Unir las bases de datos
merge(categoria_datos_junio,
profe_datos,
key=(CAT_EMEFUT))
InformeFinal_junio <- merge(categoria_datos_junio,
profe_datos,
key=(CAT_EMEFUT))
View(InformeFinal_junio)
InformeFinal_junio$Sede <- NULL
InformeFinal_junio$Categoría <- NULL
InformeFinal_junio$CAT_EMEFUT <- NULL

#Reordenar y filtrar sólo los datos únicos para quedar con la tabla final.  
InformeFinal_junio <- InformeFinal_junio[,c(4,5,1,2,3)]

InformeFinal_junio %>%
  distinct()

InformeFinal_junio <- InformeFinal_junio %>%
  distinct()








