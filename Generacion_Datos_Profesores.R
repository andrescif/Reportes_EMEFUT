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












