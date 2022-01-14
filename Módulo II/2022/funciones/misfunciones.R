# Funciones
# install.packages("dplyr")
library(dplyr)

media_geom <- function (valores) {
  n <- length(valores)
  multiplicacion <- 1
  for (var in numeros) {
    # print(var)
    multiplicacion <- multiplicacion * var
  }
  multiplicacion
  media_geometrica <- multiplicacion ^ (1/n)
  media_geometrica
}



# Mis funciones
#Esta función reparte cartas de un mazo de 52
baraja <- c("A","2","3","4","5","6","7","8","9","10","J","Q","K")
mazo <- rep(baraja,4)

mazo2 <- c("AC","2C","3C","4C","5C","6C","7C","8C","9C","10C","JC","QC","KC",
           "AP","2P","3P","4P","5P","6P","7P","8P","9P","10P","JP","QP","KP",
           "AT","2T","3T","4T","5T","6T","7T","8T","9T","10T","JT","QT","KT",
           "AD","2D","3D","4D","5D","6D","7D","8D","9D","10D","JD","QD","KD")

f.repartir.cartas <- function() {
  sample(x = mazo,size = 1)
}


f.determinar.puntos <- function(carta) {
  if (carta == "A") {
    puntos = 1
  } else if (carta == "J" | carta == "Q" | carta == "K") {
    puntos = 10
  } else {
    puntos = as.numeric(carta)
  }
  puntos
}


f.sumar.cartas <- function(datos){
  datos <- datos %>%
      mutate(valor1 = ifelse (C1 == "A", 1, 
              ifelse(C1 =="J" | C1 == "Q" | C1 == "K",
               10,as.numeric(C1))))
  
  datos <- datos %>%
    mutate(valor2 = ifelse (C2 == "A", 1, 
                            ifelse(C2 =="J" | C2 == "Q" | C2 == "K",
                                   10,as.numeric(C2))))
  datos <- datos %>%
    mutate(suma = valor1 + valor2)
  datos
}
