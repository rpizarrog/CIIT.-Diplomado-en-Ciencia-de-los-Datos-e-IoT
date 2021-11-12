# Regresión Logística Multinomial
# Se utiliza la función multinom() porque el valor de la variable tene tres valores

# Objetivo: 

# Predecir si una persona GANA 'BAJO' 'REGULAR' O 'ALTO'
# Se utiliza un conjunto de datos preparado en donde se prepara 
# una variable con los valores de BAJO, REGULAR ALTO según sus ingersos económicos
# Esta variable se transforma aleatoriamente a partir de la variable
# income10 que viene en el conjunto de datos

# **************
# LIBRERIAS
library(ggplot2)
library(dplyr)
library(knitr)
library(caret)
library(readr)
library(knitr)
library(nnet)   # Para Regresión logística multinomial

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
datos.preparados <- datos[,c(2, 3, 4, 6, 7, 8, 9,15)]

# **************
# DATOS DE ENTRENAMIENTO Y VALIDACION
# PARTIR LOS DATOS

# Datos de entrenamiento: Con los cuales se construye el modelo
# Datos de validación: Con los cuales se predice y se compara con los datos reales
set.seed(2021)
entrena <- createDataPartition(y = datos.preparados$income.clas, 
                               p = 0.7, 
                               list = FALSE, 
                               times = 1)

# Datos entrenamiento
datos.entrenamiento <- datos.preparados[entrena, ]  # [renglones, columna]

# Datos validación
datos.validacion <- datos.preparados[-entrena, ]


# **************
# CONSTRUIR MODELO CON DATOS DE ENTRENAMIENTO
# Como es un conjunto de datos en donde la variable
# es multinomial ('varios valores no solo binomial dos')
# entonces se utiliza la función multinom de la librería nnet

library(nnet)
# modelo <- glm()

modelo <- multinom(formula = income.clas ~ age + workclass + 
                education + marital.status + race +
      gender + hours.per.week, 
      data = datos.entrenamiento)

modelo
summary(modelo)


# **************
# PREDECIR CON DATOS DE VALIDACION
predicciones <- predict(object = modelo, 
                        newdata = datos.validacion)

predicciones

# EVALUAR MATRIZ DE CONFUSION CON RESPECTO A PREDICCIONES
# Agegar una columna al final de los datos de validación con las predicciones
# cbind() significa agregar una columna también se puede hacer por mutate()

datos.validacion.compara <- cbind(datos.validacion, predicciones)
datos.validacion.compara

table(datos.validacion.compara$income.clas, 
      datos.validacion.compara$predicciones)

# Factorizar para hacerlos del mismo tipo character pero factor
datos.validacion.compara$income.clas <- as.factor(datos.validacion.compara$income.clas)
datos.validacion.compara$predicciones <- as.factor(datos.validacion.compara$predicciones)


# class() devuelve el tipo de dato de un objeto
class(datos.validacion.compara$income.clas)
class(datos.validacion.compara$predicciones)


confusionMatrix(datos.validacion.compara$predicciones,
                datos.validacion.compara$income.clas)



# Accuracy #Precision o Exactitud
# El modelo construid tiene una exactitud del 0.4954 significa 
# que le atina en un 49%

# A cuánts caso se le atinó
matriz <- table(datos.validacion.compara$income.clas, 
      datos.validacion.compara$predicciones)
aciertos <- sum(matriz[1,1], matriz[2,2], matriz[3,3])
aciertos

N <- nrow(datos.validacion.compara) # Total de registros
N

exactitud <- aciertos / N
exactitud

# Precision


# **************
# PREDECIR CON DATOS NUEVOS





# **************
# INTERPRETAR

