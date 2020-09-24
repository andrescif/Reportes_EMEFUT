library(tidyverse)
#Cargar datos
valuacion_profes <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Evaluación de profesores (Responses) - Form Responses 1.csv")
#Nombres de variables
names(Evaluacion_profes) <- c("Timestamp","Sede","Total_profesores","Nombre","Comunicacion_encargado",
                              "Sigue_instrucciones","Comunicacion_alumnos","Calidad_trabajo","Comentario")

#Revisar la data
str(Evaluacion_profes)
table(Evaluacion_profes$Comunicacion_encargado,useNA = "ifany")
table(Evaluacion_profes$Sigue_instrucciones,useNA = "ifany")
table(Evaluacion_profes$Comunicacion_alumnos,useNA = "ifany")
table(Evaluacion_profes$Calidad_trabajo,useNA = "ifany")

write.csv(Evaluacion_profes,
          file = "Evaluacion de profesores por encargados")
