# REGRESION LOGISITICA MULTINOMIAL 
# CON DATOS DE Sistema Operativo que usaron
# Los datos están en: "https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/datos/usuarios_win_mac_lin.csv"


# Objetivo.

# Predecir cual sistema operativo utilizará una persona  
# mediante la construcción de un modelo de regresión logísitica multinomial

# Evaluar un modelo de regresión logística multinomial en términos de exactitud Accuracy


# LIBRERIAS
library(ggplot2)
library(dplyr)
library(knitr)
library(caret)
library(readr)
library(knitr)
library(nnet) 


# Datos

datos <- read.csv("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/datos/usuarios_win_mac_lin.csv")
datos

str(datos)
summary(datos)

# LOS DATOS ESTAN PREPARADOS
# A menos que s dese TRANSFORMAR el valor de la variavle clase a 
#0 - Windows
#1 - Macintosh
#2 -Linux

datos <- mutate(datos, clase = ifelse(clase == 0, 'Windows', clase))
datos <- mutate(datos, clase = ifelse(clase == 1, 'Macintosh', clase))
datos <- mutate(datos, clase = ifelse(clase == 2, 'Linux', clase))

# DATOS DE ENTRENAMIENTO Y DATOS DE VALIDACION
# **************
# DATOS DE ENTRENAMIENTO Y VALIDACION
# PARTIR LOS DATOS

# Datos de entrenamiento: Con los cuales se construye el modelo
# Datos de validación: Con los cuales se predice y se compara con los datos reales
set.seed(2021)
entrena <- createDataPartition(y = datos$clase, 
                               p = 0.7, 
                               list = FALSE, 
                               times = 1)

# Datos entrenamiento
datos.entrenamiento <- datos[entrena, ]  # [renglones, columna]

# Datos validación
datos.validacion <- datos[-entrena, ]

# CONTRUIR EL MODELO
# clase ~ . clase como variable dependiente de todas las variables independientes
modelo <- multinom(data = datos.entrenamiento, 
                   formula = clase ~ .)
modelo


modelo <- multinom(data = datos.entrenamiento, 
                   formula = clase ~ duracion + paginas + 
                     acciones + valor)
modelo


# PREDECIR
predicciones <- predict(object = modelo, newdata = datos.validacion)
predicciones

datos.validacion.compara <- cbind(datos.validacion, predicciones)
datos.validacion.compara


matriz <- table(datos.validacion.compara$clase, 
                datos.validacion.compara$predicciones )
matriz 

# EVALUAR MODELO 
# Accuracy = Exactitud
# Accuracy #Precision o Exactitud

# A cuántos caso se le atinó
aciertos <- sum(matriz[1,1], matriz[2,2], matriz[3,3])
aciertos

N <- nrow(datos.validacion.compara) # Total de registros
N

exactitud <- aciertos / N
exactitud


# Factorizar para hacerlos del mismo tipo character pero factor
datos.validacion.compara$clase <- as.factor(datos.validacion.compara$clase)
datos.validacion.compara$predicciones <- as.factor(datos.validacion.compara$predicciones)

confusionMatrix(datos.validacion.compara$predicciones,
                datos.validacion.compara$clase)