# Regresión Logística
# Se utiliza la función gml()


# Objetivo: 

# Predecir si una persona GANA por encima de o por debajo 
# de 50 mil dólares al año en USA
# Se utiliza un conjunto de datos preparado 

# **************
# LIBRERIAS
library(ggplot2)
library(dplyr)
library(knitr)
library(caret)
library(readr)
library(knitr)

# **************
# DATOS

datos <- read.csv("https://raw.githubusercontent.com/rpizarrog/FundamentosMachineLearning/master/datos/adultos_clean.csv",
                  stringsAsFactors = TRUE)


# **************
# DESCRIBIR LOS DATOS

summary(datos)
str()

# **************
# PREPARAR DATOS

# Variables independientes

# DEFINIR ETQUETAS
# 0 Gana POR DEBAJO O IGUAL de 40 mil dólares: BAJO
# 1 Gana MAYOR A 40 mil y POR DEBAJO O IGUAL A 50 mil dólares: REGULAR
# 2 Gana por ENCIMA DE 50 mil dólares ALTO

datos <- mutate(datos, income.clas = NA,  .after = income10)
datos <- mutate(datos, income.clas = ifelse(income10 == 1, 
                                             'ALTO', income.clas))
datos <- mutate(datos, income.clas = ifelse(income10 == 0,
                                             sample(x = c('BAJO', 'REGULAR'), 
                                                          size = 37155, replace = TRUE ) 
                                             , income.clas))

table(datos$income.clas) # Frecuencia por la variabe dependiente de interés

v.independientes <- names(datos[c(2, 3, 4, 6, 7, 8, 9, 13,15)])
v.independientes

v.dependiente <- names(datos[15])
v.dependiente                       

# Depurar las variables que interesan incluyendo la idependiente
datos <- datos[,c(2, 3, 4, 6, 7, 8, 9, 13,15)]

# **************
# DATOS DE ENTRENAMIENTO Y VALIDACION



# **************
# CONSTRUIR MODELO CON DATOS DE ENTRENAMIENTO



# **************
# PREDECIR CON DATOS DE VALIDACION


# EVALUAR MATRIZ DE CONFUSION
# Accuracy

# Precision


# **************
# PREDECIR CON DATOS NUEVOS





# **************
# INTERPRETAR

