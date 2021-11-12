# REGRESION POLINOMICA
# LIBRERÍAS
library(readr)
library(dplyr)  # select, filter, mutate, %>%, group_by sumarize
library(ggplot2)
library(caret)  # Para particionar datos install.packages("caret")

# CARGAR DATOS
datos <- read.csv("datos/fifa_datos.csv", 
                  encoding = "UTF-8")


# DESCRIBIR DATOS
summary(datos)
str(datos)


# VARIABLES independiente(s) y dependiente
datos.dos <- select(datos, Name, Value, Overall)


# LIMPIEZA de los datos
# Convertir Value a numérico y quitar E y M como vienen originalmente
# Overall viene bien
source("https://raw.githubusercontent.com/rpizarrog/FundamentosMachineLearning/master/scripts/misfunciones.r")

datos <- datos %>%
  mutate(Valor = ifelse (substr(Value, nchar(Value), nchar(Value)) == 'M', fcleanValue(Value) * 1000000, fcleanValue(Value) * 1000)) %>%
  filter(Valor > 0)

datos.dos <- select(datos, Name, Value, Overall, Valor)


# Se observa algunos datos NA en Value
# Que hacemos?
# Poner el valor mean() median() o quitarlos
# Ya se limpiaaron con la función ...
# GRAFICA Generar la gráfica de dispersión 

ggplot(datos.dos, aes(x = Overall, y = Valor)) + 
  geom_point()


# PARTIR LOS DATOS

# Datos de entrenamiento: Con los cuales se construye el modelo
# Datos de validación: Con los cuales se predice y se compara con los datos reales
set.seed(2021)
entrena <- createDataPartition(y = datos.dos$Value, 
                               p = 0.7, 
                               list = FALSE, 
                               times = 1)

# Datos entrenamiento
datos.entrenamiento <- datos.dos[entrena, ]  # [renglones, columna]

# Datos validación
datos.validacion <- datos.dos[-entrena, ]

# CONSTRUIR EL MODELO POLINOMICO
modelo.dos <- lm(datos.entrenamiento, formula = Valor ~ poly(Overall,2))
summary(modelo.dos)


modelo.cuatro <- lm(datos.entrenamiento, formula = Valor ~ poly(Overall,4))
summary(modelo.cuatro)


# TENDENCIA

ggplot() + 
  geom_point(data = datos.dos, 
             aes(x = Overall, y = Valor)) + 
  geom_line(aes( x = datos.dos$Overall, y = predict(modelo.cuatro, datos.dos)), 
            color = "red")
# EVALUAR EL MODELO

paste("El modelo polinómioc a la cuarta potenca genera un mayor coefiencien de determinación Multiple R-squared:  0.9095,	Adjusted R-squared:  0.9095")
paste("Significa que la variable Overall representa", 90.95,"%", " el valor económico de un jugador")
paste ("Los coeficientes establece que las variables son abosultamente y esadísticamente significativas < 0.001")

#PREDECIR CON DATOS DE VALIDACION Y COMPARAR
prediccion <- predict(modelo.cuatro, newdata = datos.validacion)

new.datos.validacion <- mutate(datos.validacion, predicho2 = prediccion)


# PREDECIR NUEVOS VALORES
Overall <- c(50, 60, 70, 80, 90)

predict(object = modelo.cuatro, newdata = data.frame(Valor = Overall))


# INTERPRETAR

paste ("Se utilzó el modelo de regresio polinómica de cuarta potencia")
paste("El valor económico de los jugadores del conjunto de validación ",
      "comparado con las prediccione puede sustenttar negocionaciones conommicas", 
      "a favor o encontra")
      
paste("Se pueden predecir el valor económico para nuevos jugadores") 

