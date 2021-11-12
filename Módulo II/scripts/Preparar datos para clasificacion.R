# CARGA LIBRERIAS
library(ggplot2)
library(dplyr)
library(knitr)
library(caret)
library(readr)
library(knitr)
library(nnet)   # Para Regresión logística multinomial


# Preparar y dejar unos datos PREPARADOS

# **************
# DATOS

datos <- read.csv("https://raw.githubusercontent.com/rpizarrog/FundamentosMachineLearning/master/datos/adultos_clean.csv",
                  stringsAsFactors = TRUE)


# **************
# DESCRIBIR LOS DATOS.Antes de preparar

summary(datos)
str(datos)

# **************
# PREPARAR DATOS

# Variables independientes

# DEFINIR ETQUETAS
# 0 Gana POR DEBAJO O IGUAL de 40 mil dólares: BAJO
# 1 Gana MAYOR A 40 mil y POR DEBAJO O IGUAL A 50 mil dólares: REGULAR
# 2 Gana por ENCIMA DE 50 mil dólares ALTO
n
# Como no existe una variable numérica de ingreso económico en los datos
# a partir de las personas que ganan POR DEBAJO O IGUAL A 50 mil, se les 
# genera aleatoriamente una etiquete de BAJO o REGULAR
# Las personas que ganan por ENCIMA de 50 mil se les pone 
# por default que etiqueta de ALTO

table(datos$income10)

# o bien

table(datos$income)

# Hay 37155 registros de personas que ganan por DEBAJO O IGUAL A 50 mil

set.seed(2021) # Semilla para funciones de aleatoriedad que salgan los mismos valores
datos <- mutate(datos, income.clas = NA,  .after = income10)
datos <- mutate(datos, income.clas = ifelse(income10 == 1, 
                                            'ALTO', income.clas))
datos <- mutate(datos, income.clas = ifelse(income10 == 0,
                                            sample(x = c('BAJO', 'REGULAR'), size = 37155, replace = TRUE) , income.clas))


table(datos$income.clas) # Frecuencia por la variable dependiente de interés

# Se identifican ¿cuáles son las variables independientes y la dependiente?
# a partir de los nombres columnas que están en las posiciones indicadas
v.independientes <- names(datos[c(2, 3, 4, 6, 7, 8, 9,15)])
v.independientes

# Se pudo hacer también por la función select() de dplyr

v.dependiente <- names(datos[15])
v.dependiente                       

# Depurar las variables que interesan incluyendo la independiente
# y solo dejar las variables de interés
datos <- datos[,c(2, 3, 4, 6, 7, 8, 9,15)]

# **************
# DATOS DE ENTRENAMIENTO Y VALIDACION
# PARTIR LOS DATOS

# Datos de entrenamiento: Con los cuales se construye el modelo
# Datos de validación: Con los cuales se predice y se compara con los datos reales
set.seed(2021)
entrena <- createDataPartition(y = datos$income.clas, 
                               p = 0.7, 
                               list = FALSE, 
                               times = 1)

# Datos entrenamiento
datos.entrenamiento <- datos[entrena, ]  # [renglones, columna]

# Datos validación
datos.validacion <- datos[-entrena, ]
