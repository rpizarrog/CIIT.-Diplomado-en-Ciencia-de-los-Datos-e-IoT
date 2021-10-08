# Manejo de Strings


library(tidyverse)
library(datos)

string1 <- "Esta es una cadena de caracteres"
string2 <- 'Si quiero incluir "comillas" dentro de la cadena, uso comillas simples'
string3 <- "Que sigifica 'algo' "


# Identificar cuantos caracteres tien un string

str_length(c(string1, string2, string3))

# Combinar dos o mas cadenas

combina <- str_c("x", "y")
combina

combinaString <- str_c(c(string1, string2, string3))
combinaString


# Concatenar un msj
nombre <- "Rubén"
hora_del_dia <- "mañana"
cumpleanios <- TRUE


str_c(
  "Que tengas una buena ", hora_del_dia, ", ", nombre,
  if (cumpleanios) " y ¡FELIZ CUMPLEAÑOS!",
  ".")

# Dividir palabras

x <- c("Manzana", "Plátano", "Pera")

str_sub(string = x, start = 1, end = 3) # Paquete string

substr(x = x, start = 1, stop = 3) # Paquete base


# Mayusculas y minusculas
saludos <- "Hola Como ESTAMOS"
minusculas <- tolower(saludos)   # Paquete base
minusculas


str_to_lower(string = saludos)  # Paquete string

str_to_upper(saludos)


# Ordenar string
frutas <- c("arándano", "espinaca", "banana", 
            "PEra", "PERON", "Manzana")

frutas[str_order(frutas, decreasing = TRUE)] # Devuelve posiciones

str_sort(frutas, locale = "es", decreasing = TRUE) # Ordena diretamente


frutas <- c(frutas, 
            c("Papaya","Melón", "Limón", "pepino"))



# Parecdio o coincidencias de las palabras
str_view(toupper(frutas), "PE")


# Todas las fruta que empiecen con un aletra

str_view(toupper(frutas), "^P")


str_view(toupper(frutas), "A$")



str_detect(frutas, "e") # Devuele posiciones


frutas[which(str_detect(tolower(frutas), "e"))]





















# MAnejo de Fechas