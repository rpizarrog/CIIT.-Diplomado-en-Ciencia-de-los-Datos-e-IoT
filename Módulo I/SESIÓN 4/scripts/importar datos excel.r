#cargar datos de excel

library(readxl)
#source="C:\Users\s_777\Mi unidad\Diplomado en ciencia de los datos\Modulo 1\Datos\participantes diplomado.csv"

datos <- read_xlsx(path="Datos/LISTA- Diplomado Internet de las Cosas.xlsx",sheet = 2, skip = 1)
datos

class(datos)
colnames(datos) <- c("posicion","nombres","ocupaciones")
frecuencias <- data.frame(table(datos$ocupaciones))
colnames(frecuencias) <- c("ocupacion","frecuencias")

barplot(height = frecuencias$frecuencias,names.arg = frecuencias$ocupacion)