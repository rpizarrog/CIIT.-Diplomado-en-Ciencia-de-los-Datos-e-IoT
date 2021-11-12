# Arboles de regresión 

# **************************
# LIBRERIAS
library(rpart) # Para crear arboles
library (MPV) # Previo install.packages("MPV"). Datos
# library(tree) # Para crear arboles
library(party) # Para particionar datos
library(rpart.plot) # Para visualizar arbol

# Librerías varias
library(readr)   # Leer datos
library(dplyr)   # Operaciones con datos, select, filter, mutate, arrange, summarize group_by %>%
library(knitr)   # Tablas amigables
library(ggplot2) # Gráficos
#library(cowplot) # Varios gráficos en un mismo renglón
#library(fdth)    # para el calculo de distribución de frecuencias.

# ************************
# DATOS
datos <- airquality # Air NY

datos
kable(datos, caption = "Los datos")

# ***************************
# DESCRIBIR algo de los datos
# ¿Cuál es la variable dependiente?
# Cuáles son variables independintes?
# ¿Cual es el objetivo?. PREDECIR Y EVALUAR

summary(datos)
str(datos)

# Variable dependiente temperatura
# El resto serán variables independientes
# Se construirá un árbol de regresión 
# porque la variable dependiente temperatura es numérica o cuantitativa





# **************************
# PREPARAR LOS DATOS
# Transformar los NA y poner la mediana de cada columna según sea el caso

median(datos$Ozone, na.rm = TRUE)

# Modificar el valor cuando existe un NA y sobreescribe datos
datos <- mutate(.data = datos, Ozone = ifelse(is.na(Ozone), 
                                              median(datos$Ozone, na.rm = TRUE), Ozone))
datos <- mutate(.data = datos, Solar.R = ifelse(is.na(Solar.R), 
                                              median(datos$Solar.R, na.rm = TRUE), Solar.R))
datos <- mutate(.data = datos, Wind = ifelse(is.na(Wind), 
                                              median(datos$Wind, na.rm = TRUE), Wind))
datos <- mutate(.data = datos, Temp = ifelse(is.na(Temp), 
                                              median(datos$Temp, na.rm = TRUE), Temp))
datos <- mutate(.data = datos, Month = ifelse(is.na(Month), 
                                              median(datos$Month, na.rm = TRUE), Month))
datos <- mutate(.data = datos, Day = ifelse(is.na(Day), 
                                              median(datos$Day, na.rm = TRUE), Day))

# Enviar datos a un archivo limpio 
write.csv(x = datos, file = "../datos/temperatura condiciones NY.csv")

  



# *****************************************
# DATOS DE ENTRENAMIENTO Y DATOS DE VALIDACION

# En esta práctica no se hace datos de entrenamiento y validación para ahorrar tiempo
# El model y la  predicción es sobre todos los datos

# ****************************
# CONSTRUIIR MODELO CON DATOS DE ENTRENAMIENTO

modelo <- rpart(formula = Temp ~ ., data=datos )

modelo

summary(modelo)

# ****************************
# VISUALIZAR Y ANALIZAR EL MODELO DE ARBOL DE REGRESION
rpart.plot(modelo)





# ****************************
# PREDECIR

# ¿Que pasa si hay estas condiciones en nuevas observacciones: ?

# month = 7
# Solar.R = 200  
# Ozone = 47.5
# Wind = 15
# Day = 6

# ¿Cuánta temperatura habrá?
mes <- c(7, 9, 6)
radiacion <- c(200, 220, 180)
ozono = c(47.5, 50, 38)
viento = c(15, 20, 10)
dia = c(6, 12, 24)

# Hay que transformarlo a dataframe como parte el modelo

nuevo_dato <- data.frame(Ozone = ozono, Solar.R = radiacion, Wind=viento, Month=mes, Day=dia)
kable(nuevo_dato)

las.predicciones <- predict(object = modelo, newdata = nuevo_dato)
las.predicciones

# ****************************
# VALORAR PREDICIONS CON LA REALIDAD
# Hacer una correlación en predicciones 
# con los datos originales valores reales de temperatura

predicciones <- predict(object = modelo, newdata = datos)
relacion <- data.frame(datos$Temp, predicciones)
kable(relacion)

correla <- cor(predicciones, datos$Temp)

paste("Según Hdz Sampiere", 
      "+0.75 = Correlación positiva considerable", 
      correla)




# ****************************
# INTERPRETAR

# Todas las variables del conjunto de datos la calida del aire 
# fueron importantes, todas participan en la declaración de reglas.
# Las predicciones fueron valoradas acertadmente
# El valor de la correlación entre las prediccion con todo el conjunto de datos y 
# con los valores reales de temperatura tienen una correlación lineal 
# de 0.8861 significa Correlación Positiva considerable


# H0 No hay una correlación positiva considerable
# H1 Si hay una correlación positiva considerable


# VERIFICAR EL ENLACE: https://rpubs.com/rpizarro/775223 PARA MAS EJEMPLOS...

