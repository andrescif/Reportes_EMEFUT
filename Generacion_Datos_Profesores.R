library(tidyverse)
#Cargar datos
Datos.de.personal.EMEFUT <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Datos de personal EMEFUT.csv")
names(Datos.de.personal.EMEFUT)

#Filtrar datos para quedarme sólo nombres, sedes y categorías
#Primer encargados A

A <- Datos.de.personal.EMEFUT %>%
  select("X.Cuál.es.su.nombre.",
         "X.Qué.sede.EMEFUT.se.encuentra.a.su.cargo.",
         "X.Con.qué.categoría.ha.estado.trabajando.durante.la.Cuarentena..enviando.videos..mensajes..entrenos..etc...") %>%
  distinct()
names(A) <- c("Nombre","Sede","Categoría")
#Limpiando
A <- A[-c(1),]

#Ahora profesores
B <- Datos.de.personal.EMEFUT %>%
  select("X.Cuál.es.su.nombre..1",
         "X.A.qué.sede.EMEFUT.pertenece.",
         "X.Con.qué.categoría.ha.estado.trabajando.durante.la.Cuarentena..enviando.videos..mensajes..entrenos..etc....1") %>%
  distinct()
names(B) <- c("Nombre","Sede","Categoría")
#Limpiando
B <- B[-c(2),]

#Reunidos en una sola base de datos
profe_nombres <- rbind(A,B)

#Limpiando mi área de trabajo
rm(Datos.de.personal.EMEFUT)
rm(A)
rm(B)

#Separar las categorías

A <- profe_nombres %>%
  separate("Categoría",
           c("CAT_1","CAT_2"),
           ",")
B<- subset.data.frame(A,
                  !is.na(A$CAT_2))

A <- A %>%
  select("Nombre","Sede","CAT_1")
names(A) <- c("Nombre","Sede","Categoría")

B <- B %>%
  select("Nombre","Sede","CAT_2")
names(B) <- c("Nombre","Sede","Categoría")

profe_nombres<- rbind(A,B)
rm(A)
rm(B)

show(profe_nombres$Sede)
show(profe_nombres$Categoría)
profe_nombres$Categoría <- as.factor(profe_nombres$Categoría)
levels(profe_nombres$Categoría)
profe_nombres$Categoría[profe_nombres$Categoría==" Infantil"] <- "Infantil"
profe_nombres$Categoría[profe_nombres$Categoría==" Intermedia"] <- "Intermedia"
profe_nombres$Categoría[profe_nombres$Categoría==" Juvenil"] <- "Juvenil"
profe_nombres$Categoría <- ordered(profe_nombres$Categoría,
                                   levels=c("Moscos","Infantil","Intermedia","Juvenil"))

save(profe_nombres,
     file = "Cuadro de Sólo Nombres con Sede y Categoría")







