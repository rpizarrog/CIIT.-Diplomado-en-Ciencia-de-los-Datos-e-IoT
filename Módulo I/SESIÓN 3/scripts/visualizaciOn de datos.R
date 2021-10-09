# Crear gráficos

# CArgar primero algunos datos
# install.packages("readr")

# carga la librería o paquete
library(readr)

datos <- read.csv("https://raw.githubusercontent.com/rpizarrog/CIIT.-Diplomado-en-Ciencia-de-los-Datos-e-IoT/main/M%C3%B3dulo%20I/datos/personas.2.csv")
datos

str(datos) # Saber la estructura del conjunto de datos


# Graficar

# Diagrama de dispersión
plot(x = datos$estaturas, y =datos$pesos,
     main = "Pesos VS Estaturas",
     xlab = "Estaturas", ylab = "Pesos",
     pch=19,col="red")

plot(x = datos$estaturas, y =datos$pesos,
     main = "Pesos VS Estaturas",
     xlab = "Estaturas", ylab = "Pesos", sub = "Dispersión")

# Histograma
hist(x = datos$edades, main = "Histograma de edades")

hist(x = datos$estaturas, main = "Histograma de estaturas")

hist(x=datos$pesos, 
     main = "Histograma Pesos", freq = TRUE)

# Diagrama de BARRA
barplot(height = c(10,20,25,30,40,15), 
        names.arg = c('A', 'B', 'C', 'D', 'E', 'F'),
        xlab = "Categorías", ylab = "Frecuencias")

pie(x = c(10,20,25,30,40,15),
    labels = c('A', 'B', 'C', 'D', 'E', 'F'))


# gráfico de barra de los datos
datos

# PAra determinar frecuencias
frecuencias <- data.frame(table(datos$zonas))
colnames(frecuencias) <- c("zona", "frecuencia")
frecuencias
barplot(height = frecuencias$frecuencia, 
        names.arg = frecuencias$zona,
        main = "Frecuencia localidades", 
        xlab = "Zonas", ylab = "Frecuencias")

# Histograma con vriables peso y genero

library(plotrix)

histStack(datos$edades, datos$generos,
legend.pos="topright")

















