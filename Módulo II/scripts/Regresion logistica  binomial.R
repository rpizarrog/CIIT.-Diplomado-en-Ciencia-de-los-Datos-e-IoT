# REGRESION LOGÍSTICA 
# Se utilizará glm()

library(tidyverse)
library(ISLR)

# Variable dependiente LOGICA 0 O 1
matricula <- as.factor(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1,
                         0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1,
                         0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0,
                         0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
                         1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0,
                         1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1,
                         1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1,
                         0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
                         0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0,
                         0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0,
                         0, 0, 0, 0, 1, 0, 0, 0, 1, 1))

# Variable independiente
matematicas <- c(41, 53, 54, 47, 57, 51, 42, 45, 54, 52, 51, 51, 71, 57, 50, 43,
                 51, 60, 62, 57, 35, 75, 45, 57, 45, 46, 66, 57, 49, 49, 57, 64,
                 63, 57, 50, 58, 75, 68, 44, 40, 41, 62, 57, 43, 48, 63, 39, 70,
                 63, 59, 61, 38, 61, 49, 73, 44, 42, 39, 55, 52, 45, 61, 39, 41,
                 50, 40, 60, 47, 59, 49, 46, 58, 71, 58, 46, 43, 54, 56, 46, 54,
                 57, 54, 71, 48, 40, 64, 51, 39, 40, 61, 66, 49, 65, 52, 46, 61,
                 72, 71, 40, 69, 64, 56, 49, 54, 53, 66, 67, 40, 46, 69, 40, 41,
                 57, 58, 57, 37, 55, 62, 64, 40, 50, 46, 53, 52, 45, 56, 45, 54,
                 56, 41, 54, 72, 56, 47, 49, 60, 54, 55, 33, 49, 43, 50, 52, 48,
                 58, 43, 41, 43, 46, 44, 43, 61, 40, 49, 56, 61, 50, 51, 42, 67,
                 53, 50, 51, 72, 48, 40, 53, 39, 63, 51, 45, 39, 42, 62, 44, 65,
                 63, 54, 45, 60, 49, 48, 57, 55, 66, 64, 55, 42, 56, 53, 41, 42,
                 53, 42, 60, 52, 38, 57, 58, 65)

datos <- data.frame(matricula, matematicas)

# Describir los datos
summary(datos)
str(datos)


table(datos$matricula)

# Diagramde caja de los datos
ggplot(data = datos, aes(x = matricula, y = matematicas, color = matricula)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.1) +
  theme_bw() +
  theme(legend.position = "null")

# CONTRUIR EL MODELO
modelo <- glm(data = datos, 
              formula =  matricula ~ matematicas, 
              family = "binomial")

summary(modelo)


# Encontrar la probabildad de acuerdo a los coeficientes obtenidos
# GRAFICA DE REGRSION LOGISTICA
datos$matricula <- as.character(datos$matricula)
datos$matricula <- as.numeric(datos$matricula)



# Evaluar el modelo

#probabilidad <- modelo$fitted.values
#probabilidad

# PREDICCIONES
# Generar nuevos datos
nuevos <- seq(from = min(datos$matematicas), to = max(datos$matematicas),
                     by = 0.5)
nuevos_datos <- data.frame(matematicas = nuevos)

predicciones <- predict(object = modelo, newdata = nuevos_datos,
                        se.fit = TRUE)

# Mediante la función logit se transforman los a probabilidades.
predicciones_prob <- exp(predicciones$fit) / (1 + exp(predicciones$fit))


# Agregar a los nuevos_puntos las columnas de predicciones y de probabilidades
# nuevos_datos <- mutate(nuevos_datos, predicciones = predicciones$fit)
nuevos_datos <- mutate(nuevos_datos, probabilidades = predicciones_prob)


# Probar valores probabilísticos

# Identificar los coefieicntes del modelo
b0 <- modelo$coefficients[1]
b1 <- modelo$coefficients[2]
prob <- e^(b0 + b1 * 33) / (1 + e^(b0 + b1 * 33))
prob

prob <- e^(b0 + b1 * 57) / (1 + e^(b0 + b1 * 57))
prob


# Comprobar que el valor de 33 da la misma probabilida 
# que la que se tiene en los nuevos_datos




# Convertir probabilidad a 0 o 1 s
# 0 = cuando la probabilidad es menor o igual que 0.5
# 1 = cuando la probabilidad es mayor que 0.5

nuevos.datos <- mutate (nuevos_datos, pred.logico = ifelse(probabilidades <= 0.5, 0,1))



# EVALUAR EL MODELO

predicciones <- ifelse(modelo$fitted.values > 0.5, yes = 1, no = 0)
matriz_confusion <- table(datos$matricula, predicciones)
matriz_confusion
# Generar matriz de CONFUSION

matriz_confusion <- table(datos$matricula, datos$pred.logico,
                          dnn = c("observaciones", "predicciones"))
matriz_confusion


# En términos de Accuracy Exactitud el modele es capaz del predecir en in 


exactidud <- sum(matriz_confusion[1,1], matriz_confusion[2,2]) / (sum(matriz_confusion))
exactidud

paste("El modelo es capaz de predecir en un ", 
      round(exactidud * 100, 2), "%")





