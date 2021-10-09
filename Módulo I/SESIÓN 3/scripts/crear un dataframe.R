# Data Frame o MArco de datos Conjunto de datos
# Renglones y Columnas

edades <- c(43, 54, 36, 34, 23, 43, 54)
nombres <- c("Juan", "Lety", "Jesús", "Lucy", "Oscar", "Pedro", "Aracely")

datos <- data.frame(edades, 
                    nombres, 
                    hermanos = c(2,3,4,0,1,3,2))
datos

class(datos)

# cbind agrega columna
datos <- cbind(datos, 
          "zona" = c("SUR", "NORTE", "SUR", "NORTE","CENTRO", "CENTRO", "SUR"))


# rbind agrega renglon a datos
datos <- rbind(datos, c(25, 'Luis', 4, "NORTE"))
datos

# Error de comprensión al querer agrega un nuevo registro a datos
#datos <- rbind(c(25, 'Luis', 4, "SUR"))
#datos