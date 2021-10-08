# Crear data.frames a partir de vectores
nombres <- c("Juan", "Pedro", "Luis", "Aracely", "Rubén", "Linda", "Brenda", "Lucy")
edades <- c(24, 34, 51, 32, 45, 30, 43, 54)
feliz <- c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE)
genero <- c('M', "M", "M", "F", "M", "F", "F", "F")

datos <- data.frame(nombres, edades, feliz, genero)

datos

