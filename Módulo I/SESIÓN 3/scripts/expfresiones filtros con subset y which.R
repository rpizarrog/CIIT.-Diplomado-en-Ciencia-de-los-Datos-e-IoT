# Función subset() para hacer filtros
subset(x = datos, subset = edades > 40)

subset(datos, hermanos <2)

subset(datos, toupper(zona) == "NORTE")

subset(datos, zona == "Norte")

subset(datos, zona == "NORTE")


# Acceder a elementos de un data frame

datos$edades

datos$nombres[1:3]

datos[c(1:3), 2]
datos[c(1:3), 'nombres']


# Actualizar datos
# Pone en MAYUSCULAS las zonas de datos
datos$zona <- toupper(datos$zona)
datos

# Poner 3  a hermnaos en donde sea nulo
datos[whichwhich(is.character(datos$hermanos)(is.na(datos$hermanos)), 'hermanos'] <- 3
datos










