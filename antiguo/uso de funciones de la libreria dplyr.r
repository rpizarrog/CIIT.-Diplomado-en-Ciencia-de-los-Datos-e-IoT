# Uso de dplyr
# install.packages("dplyr")

library(dplyr)
library(readr)

datos.personas <- read.csv("https://raw.githubusercontent.com/rpizarrog/FundamentosMachineLearning/master/datos/personas.2.csv", encoding = "iso-8859-1", stringsAsFactors = TRUE)
datos.personas 

# select
# select significa proyectar ciertas variables deun data frame
# vista de manera vertical
select(datos.personas, nombres, edades)

select(datos.personas, nombres, edades, zonas)


# filter
# Hace un fitro o vista de manera horizontal
# Se requiere una expresion booleana que de verdadero para 
# determinar el resultado
filter(.data = datos.personas, edades > 35)

# mutate

datos.personas <- mutate(datos.personas, media.edades = mean(edades))

# arrange

datos.ordenados <- datos.personas %>%  # es un pipe
  arrange(edades)

# pipes o tuberías o conexiones entre intrucciones
# %>%

# select nombres, edades 
# from datos.personas
#   where zona == "CENTRO"
#   order by nombre

datos.personas %>%
  select(nombres, edades, zonas) %>%
  filter(zonas == "CENTRO") %>%
  arrange(nombres)



# summarize() resumen con group_by es como funciones de agregados
# select zonas, mean(edad)
#   from datos,personas
#   group by zonas


# MEdias y desviaciones por edades
datos.personas %>%
  group_by(zonas) %>%
    summarise(media = mean(edades), desv.std = sd(edades))

# Frecuencia por zonas
datos.personas %>%
  group_by(zonas) %>%
  summarise(frecuencia = n())

