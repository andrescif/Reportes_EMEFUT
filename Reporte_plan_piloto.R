library(tidyverse)

#Cargar datos
Avances.hasta.el.lunes.19.de.octubre <- 
  read.csv("~/R Projects/Reportes_EMEFUT/Datos/Avances hasta el lunes 19 de octubre.csv")
#Variable
datos <- Avances.hasta.el.lunes.19.de.octubre
rm(Avances.hasta.el.lunes.19.de.octubre)
#Colocar nombres de variables
names(datos) <-  c("Fecha de reporte","Fecha de contacto",
                   "Sede","Categoría","¿Llamadas?",
                   "Llamadas realizadas","Llamadas efectivas",
                   "¿Mensajes?", "Mensajes enviados",
                   "Mensajes efectivos","¿Entrenamientos?",
                   "¿Cuántos entrenamientos?", "%Recibió",
                   "%Realizó","¿Entreno nueva normalidad?","¿Categoria nueva normalidad?",
                   "¿Turnos nueva normalidad?","Atendidos nueva normalidad","Comentario")

#Nombrar variables
datos$`Fecha de contacto` <- as.Date(datos$`Fecha de contacto`,format="%Y-%m-%d")
table(datos$`¿Entreno nueva normalidad?`)
datos_piloto <- datos %>%
  filter(datos$`¿Entreno nueva normalidad?`=="Sí")
table(datos_piloto$`Fecha de contacto`)

write.csv(datos_piloto,
          file = "Tabla resultados pilot 10_2020")
table(datos_piloto$`Atendidos nueva normalidad`,
      useNA = "ifany")
datos_piloto$`Atendidos nueva normalidad`=="NA"

#Filtro sólo con atendidos
datos_piloto <- datos_piloto %>%
filter(datos_piloto$`Atendidos nueva normalidad`!="NA")
datos_piloto=datos_piloto[-18,]

#Gráficos
ggplot(datos_piloto,
       aes(Sede,`Atendidos nueva normalidad`,fill=`¿Categoria nueva normalidad?`))+
  theme_bw()+
  geom_col()+
  labs(title = "Atendidos por sede",
       y="Cantidad de atendidos")+
  guides(fill=guide_legend(title="Categoría"))

#Tabla de resultados
solo_datos<- subset.data.frame(datos_piloto,
                  select = c(Sede,`¿Categoria nueva normalidad?`,`Atendidos nueva normalidad`))
tabla_solo_datos <- solo_datos %>%
  group_by(solo_datos$Sede,
           solo_datos$`¿Categoria nueva normalidad?`) %>%
  summarise(Total_atendidos=sum(`Atendidos nueva normalidad`))

write.csv(tabla_solo_datos,
          file = "Tabla resumen datos atendidos plan piloto")




