# Utilizar la función sample()


persona <- sample(x = c("Hombre", "Mujer"), size = 1, 
       replace = TRUE)
persona


# Se tiene una bolsa de Canicas  de 18 con diferentes colores
canicas <- c(rep("AZUL", 4), rep("VERDE", 6), rep("ROJA", 8))
canicas         

N <- length(canicas)
N

extraer.canica <-  sample(x = canicas, size = 1, replace = TRUE)
extraer.canica

# Sembrar una semilla 
set.seed(2021)

# Extraer en un experiemto 100 canicas y devolverlas a la bolsa 
# la canica extraída
extraer.100.canicas <-  sample(x = canicas, size = 100, replace = TRUE)
extraer.100.canicas


# Determinar las frecuencias
frecuencias <- table(extraer.100.canicas)
frecuencias



edad.personas <- sample(x = 18:65, size = 10000, replace = TRUE)+
edad.personas


summary(edad.personas)


# Estados de la republicA MEXICANA
estados <- c("BAJA CALIFORNIA", "BAJA CALIFORNIA SUR", "SONORA", 
             "CHIHUAHUA", "DURANGO", "COAHUILA", "NUEVO LEÓN", "TAMAULIPAS")
estados

estado <- sample(x = estados, size = 10000, replace = TRUE)
estado


# GENERO MASCULINO O FEMENINO 
generos <- c("MASCULINO", "FEMENINO")

genero <- sample(x = generos, size = 10000, 
                  replace = TRUE, prob = c(0.48, 0.52))
genero

# FELICIDAD
nivel.felicidad <- c("FELIZ", "NO FELIZ")


felicidad <- sample(x = nivel.felicidad, size = 10000, 
                 replace = TRUE, prob = c(0.50, 0.50))
felicidad


datos.personas <- data.frame(edad = edad.personas, 
                       genero = genero, 
                       estado = estado,
                       feliz = felicidad)
datos.personas





