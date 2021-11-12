# Arboles de Clasificaci´0n 

# Objetivo: 

# Predecir si una persona GANA 'BAJO' 'REGULAR' O 'ALTO'
# Evaluar el modelo en términos de accuracy
# 
# 

# LIBRERIAS PARA ARBOLES
library(rpart) # Para crear arboles
#library (MPV) # Previo install.packages("MPV"). Datos
# library(tree) # Para crear arboles
library(party) # Para particionar datos
library(rpart.plot) # Para visualizar arbol


# Carga los datos
# source("Machine Learning/Preparar datos para clasificacion.r")
source("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/machine%20learning/Preparar%20datos%20para%20clasificacion.R")

v.independientes
v.dependiente
# APLICAR MODELO DE ARBOL DE CLASIFICAION
modelo <- rpart(data = datos.entrenamiento, formula = income.clas ~ .)
modelo

summary(modelo)

# Dibujar el arbol


prp(modelo, nn = TRUE, fallen.leaves = TRUE, 
    split.box.col = "lightblue",  
    split.border.col = "darkgray", 
    split.round = 5, round = 5)

modelo2 <- rpart(data = datos.entrenamiento, 
                 formula = income.clas ~ marital.status + education + age)
summary(modelo2)

prp(modelo2, nn = TRUE, fallen.leaves = TRUE, 
    split.box.col = "white",  
    split.border.col = "darkgray", 
    split.round = 5, round = 5)

# PREDECIR

predicciones <- predict(object = modelo2, newdata = datos.validacion, 
                        type = "class")
predicciones

# Se requieren solo los valores de la predicciones
predicciones <- as.vector(predicciones)
predicciones

datos.validacion.compara <- mutate(datos.validacion, predicciones)

matriz <- table(datos.validacion.compara$income.clas, 
      datos.validacion.compara$predicciones)
matriz

exactitud = sum(diag(matriz) / sum(matriz))
exactitud



# Factorizar para hacerlos del mismo tipo character pero factor
datos.validacion.compara$income.clas <- as.factor(datos.validacion.compara$income.clas)
datos.validacion.compara$predicciones <- as.factor(datos.validacion.compara$predicciones)

confusionMatrix(datos.validacion.compara$predicciones,
                datos.validacion.compara$income.clas)


paste("El modelo es capaz de predecir con un 48.52% en accuracy = exactiud = precision")


# PREDECIR 

edad <- 51
estado.civil <- 'Married'
educacion <- 'HighGrad'

nuevo_dato <- data.frame(marital.status = estado.civil,
                         education = educacion,
                         age = edad)
nuevo_dato

print("Debe de ser BAJO")

predict(object = modelo2, 
        newdata = nuevo_dato, type = 'class')

# COMPARANDO CON EL MODELO DE REGRESIONLOGISTICA MLTINOMAL
paste("El modelo de arbol clasificación tuvo un accuracy de :",0.4852,
      "El modelo de regresión logística tuvo un accuracy de :",0.4954) 


