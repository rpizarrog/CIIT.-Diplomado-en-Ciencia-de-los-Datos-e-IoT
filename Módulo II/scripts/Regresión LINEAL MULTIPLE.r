# Regresión LINEAL MULTIPLE


# CARGAR LIBRERIAS

library(readr)
library(ggplot2)
library(caret)

library(dplyr)
library(knitr)  # vER TABLAS AMIGABLES
library(patchwork) # PAra varias gráficos en el mismo renglón


options(scipen = 999) # Notación NO CENTÍFICA
# CARGAR DATOS CONSTRUYEN

set.seed(2021)
n <- 362

dinero <- c(round(rnorm(n = 164, mean = 25, sd = 1), 2), round(rnorm(n = 100, mean = 28, sd = 1), 2), round(rnorm(n = 100, mean = 34, sd = 1), 2) )
#dinero

promedio <- promedio <- c(round(rnorm(n=91, mean = 90, sd = 4),0), round(rnorm(n=91, mean = 85, sd = 4),0), round(rnorm(n=91, mean = 80, sd = 4),0), round(rnorm(n=91, mean = 75, sd = 4),0))
# promedio

emocional <- c(round(rnorm(n=91, mean = 80, sd = 10),0), round(rnorm(n=91, mean = 70, sd = 10),0), round(rnorm(n=91, mean = 60, sd = 10),0), round(rnorm(n=91, mean = 50, sd = 10),0))

social <- c(round(rnorm(n=100, mean = 70, sd = 15),0),round(rnorm(n=100, mean = 60, sd = 15),0), round(rnorm(n=164, mean = 50, sd = 15),0) )

bienestar <- c(round(rnorm(n=100, mean = 80, sd = 10),0), round(rnorm(n=100, mean = 60, sd = 10),0), round(rnorm(n=164, mean = 40, sd = 10),0))

datos <- data.frame(dinero, emocional, social, bienestar, promedio)

datos




# DESCRIBIR LOS DATOS
summary(datos)
str(datos)

# IDENTIFICAR VARIABLES INDEPENDIENTES Y DEPENDIENTE
# dependiente = promedio
# independients = dinero, emocional, social,bienestar

# GRAFICOS DE DISPRESION Posiblemente 
plot(datos)




g <- ggplot(data = datos, mapping = aes(x = dinero, y = promedio)) +
  geom_point(color = "forestgreen", size = 2) +
  labs(title  =  'promedio ~ dinero', x  =  'dinero') +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) 

g

# DATOS ENTRENAMIENTO Y VALIDACION
entrena <- createDataPartition(y = datos$bienestar, p = 0.7, list = FALSE, times = 1)

datos.entrenamiento <- datos[entrena, ]  # [renglones, columna]

datos.entrenamiento
datos.validacion <- datos[-entrena,]
datos.validacion


# COSTRUIR EL MODELO
#modelo <- lm(data = datos.entrenamiento, 
#             formula = promedio ~ .)

modelo <- lm(data = datos.entrenamiento, 
             formula = promedio ~ dinero + emocional + bienestar)
     
# EVALUAR EL MODELO
summary(modelo)
anova(modelo)


# PREDECIR CON DATOS DE VALIDACION
prediccion <- predict(modelo, newdata = datos.validacion)

new.datos.validacion <- mutate(datos.validacion, predicho2 = prediccion)


# PREDECIR CON DATOS NUEVOS

#persona1 <- c(20, 80, 70)
#persona2 <- c(18, 90, 65)
#persona3 <- c(20, 80, 56)

dinero <- c(20, 18,20)
emocional <- c(70, 65,56)
bienestar <- c(80,90,80)


predict(object = modelo, 
        newdata = data.frame(dinero, emocional, bienestar))

# INTERPRETAR

paste ("Las variables independientes del modelo si son estad´siticamente significativas ",
       "que sus coefientes son diferentes de cero")
paste("El valor de Coeficiente de Determinación ajustado es Adjusted R-squared:  0.5551 ",
      55.03,"%", "Es que tanto impactan o representan las variables al promedio ")



# OTRO EJERCICIO

"https://rpubs.com/Joaquin_AR/226291"



