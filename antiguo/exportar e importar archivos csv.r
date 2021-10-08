# Instlar paquete y cargar librrías

# Instalar el paquete readr permite importar y exportar 
# achivoso del tipo csv

# install.packages("readr")

# Cargar libreria

library(readr)

# write.csv() permite exportar datos
write.csv(x = datos, file = "datos/personas.csv")


# Importar o cargar un conjunto de datos de 
# un tipo de arhcivo csv
datos <- read.csv(file = "datos/personas.2.csv", header = TRUE, 
         sep = ",")
datos
